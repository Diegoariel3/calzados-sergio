import { env } from 'cloudflare:workers';
import { getChatGPTUser } from '../app/chatgpt-auth';
import { demoProducts } from './demo';
export function db(){return env.DB!;}
export async function admin(){const user=await getChatGPTUser(); if(!user)throw new Error('AUTH'); const allowed=(env as unknown as Record<string,string>).ADMIN_EMAIL; if(allowed && user.email?.toLowerCase()!==allowed.toLowerCase())throw new Error('AUTH'); /* This version is deployed owner-private. Before public access, ADMIN_EMAIL is mandatory. */ return user;}
export async function catalog(all=false){const p=await db().prepare(`SELECT * FROM products ${all?'':'WHERE active=1'} ORDER BY created_at DESC`).all();if(!p.results.length)return {products:all?[]:demoProducts,preview:true};const v=await db().prepare('SELECT * FROM variants').all();return {products:p.results.map((r:any)=>({...r,images:JSON.parse(r.images),variants:v.results.filter((x:any)=>x.product_id===r.id)})),preview:false};}
export function safeImage(s:string){return /^\/images\/[\w.-]+$/.test(s)||/^\/api\/store\/image\/[\w.-]+$/.test(s)||/^https:\/\//.test(s);}
