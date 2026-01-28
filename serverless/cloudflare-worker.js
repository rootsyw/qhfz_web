/**
 * Cloudflare Worker - 博客 API
 * 清华附中冬令营 - 极智挑战
 */

export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    const path = url.pathname;

    // CORS 头
    const corsHeaders = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
    };

    if (request.method === 'OPTIONS') {
      return new Response(null, { headers: corsHeaders });
    }

    // 路由处理
    if (path === '/api/comments' && request.method === 'GET') {
      return handleGetComments(url, env, corsHeaders);
    }

    if (path === '/api/comments' && request.method === 'POST') {
      return handlePostComment(request, env, corsHeaders);
    }

    if (path === '/api/stats') {
      return handleStats(url, env, corsHeaders);
    }

    return new Response('Not Found', { status: 404 });
  }
};

// 获取留言
async function handleGetComments(url, env, corsHeaders) {
  const page = url.searchParams.get('page') || '/';

  // 使用 KV 存储
  const key = `comments:${page}`;
  const data = await env.BLOG_KV.get(key, 'json') || [];

  return new Response(JSON.stringify({ comments: data }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' }
  });
}

// 发布留言
async function handlePostComment(request, env, corsHeaders) {
  const body = await request.json();
  const { page, nickname, content } = body;

  if (!nickname || !content) {
    return new Response(JSON.stringify({ error: '昵称和内容不能为空' }), {
      status: 400,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' }
    });
  }

  const key = `comments:${page || '/'}`;
  const comments = await env.BLOG_KV.get(key, 'json') || [];

  comments.unshift({
    nickname,
    content,
    created_at: new Date().toISOString()
  });

  await env.BLOG_KV.put(key, JSON.stringify(comments.slice(0, 100)));

  return new Response(JSON.stringify({ success: true }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' }
  });
}

// 统计
async function handleStats(url, env, corsHeaders) {
  const page = url.searchParams.get('page') || '/';

  const pageViews = await env.BLOG_KV.get(`views:${page}`) || 0;
  const totalViews = await env.BLOG_KV.get('views:total') || 0;

  return new Response(JSON.stringify({
    page_views: parseInt(pageViews),
    total_views: parseInt(totalViews)
  }), {
    headers: { ...corsHeaders, 'Content-Type': 'application/json' }
  });
}
