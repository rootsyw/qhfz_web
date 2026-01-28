/**
 * 清华附中冬令营博客 - 前端交互
 * 功能：留言板 + 访客统计 + UI 增强
 */

const API_BASE = window.API_BASE || 'http://localhost:8080';
const currentPage = window.location.pathname;

// ============ 页面加载 ============
document.addEventListener('DOMContentLoaded', () => {
    loadComments();
    recordVisit();
    loadStats();
    setupCommentForm();
    setupReadingProgress();
    setupBackToTop();
});

// ============ 留言功能 ============
async function loadComments() {
    const container = document.getElementById('comments-list');
    if (!container) return;

    try {
        const res = await fetch(`${API_BASE}/api/comments?page=${currentPage}`);
        const data = await res.json();

        if (data.comments.length === 0) {
            container.innerHTML = '<p class="empty-tip">还没有留言，来说点什么吧。</p>';
            return;
        }

        container.innerHTML = data.comments.map(c => `
            <div class="comment-item">
                <div class="comment-header">
                    <span class="nickname">${escapeHtml(c.nickname)}</span>
                    <span class="time">${formatTime(c.created_at)}</span>
                </div>
                <p>${escapeHtml(c.content)}</p>
            </div>
        `).join('');
    } catch (e) {
        container.innerHTML = '<p class="empty-tip">留言加载失败</p>';
    }
}

function setupCommentForm() {
    const form = document.getElementById('comment-form');
    if (!form) return;

    form.addEventListener('submit', async (e) => {
        e.preventDefault();
        const btn = form.querySelector('button');
        const nickname = document.getElementById('nickname').value.trim();
        const content = document.getElementById('content').value.trim();

        if (!nickname || !content) return;

        btn.disabled = true;
        btn.textContent = '...';

        try {
            const res = await fetch(`${API_BASE}/api/comments`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ page: currentPage, nickname, content })
            });
            const data = await res.json();

            if (data.success) {
                document.getElementById('content').value = '';
                loadComments();
            } else {
                alert(data.error || '发送失败');
            }
        } catch (e) {
            alert('网络错误，请稍后重试');
        } finally {
            btn.disabled = false;
            btn.textContent = '发送';
        }
    });
}

// ============ 访客统计 ============
async function recordVisit() {
    try {
        await fetch(`${API_BASE}/api/stats/record`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ page: currentPage })
        });
    } catch (e) {
        // 静默失败
    }
}

async function loadStats() {
    const container = document.getElementById('page-stats');
    if (!container) return;

    try {
        const res = await fetch(`${API_BASE}/api/stats?page=${currentPage}`);
        const data = await res.json();

        container.innerHTML = `
            <span>本页 ${data.page_views || 0} 次浏览</span>
            <span>全站 ${data.total_views || 0} 次浏览</span>
        `;
    } catch (e) {
        container.innerHTML = '';
    }
}

// ============ 阅读进度条 ============
function setupReadingProgress() {
    const bar = document.getElementById('reading-progress');
    if (!bar) return;

    // 仅在文章页显示
    const content = document.querySelector('.post-content');
    if (!content) {
        bar.style.display = 'none';
        return;
    }

    window.addEventListener('scroll', () => {
        const scrollTop = window.scrollY;
        const docHeight = document.documentElement.scrollHeight - window.innerHeight;
        const progress = docHeight > 0 ? (scrollTop / docHeight) * 100 : 0;
        bar.style.width = progress + '%';
    });
}

// ============ 返回顶部 ============
function setupBackToTop() {
    const btn = document.getElementById('back-to-top');
    if (!btn) return;

    window.addEventListener('scroll', () => {
        if (window.scrollY > 300) {
            btn.classList.add('visible');
        } else {
            btn.classList.remove('visible');
        }
    });

    btn.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
}

// ============ 工具函数 ============
function escapeHtml(text) {
    const div = document.createElement('div');
    div.textContent = text;
    return div.innerHTML;
}

function formatTime(timeStr) {
    try {
        const date = new Date(timeStr);
        const now = new Date();
        const diff = (now - date) / 1000;

        if (diff < 60) return '刚刚';
        if (diff < 3600) return Math.floor(diff / 60) + ' 分钟前';
        if (diff < 86400) return Math.floor(diff / 3600) + ' 小时前';
        if (diff < 604800) return Math.floor(diff / 86400) + ' 天前';

        return date.toLocaleDateString('zh-CN');
    } catch (e) {
        return timeStr;
    }
}
