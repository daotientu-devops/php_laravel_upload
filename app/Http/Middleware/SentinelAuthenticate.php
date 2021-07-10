<?php
namespace App\Http\Middleware;
use Closure;
use Sentinel;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class SentinelAuthenticate{
    /**
     * Handle an incoming request
     * 
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next){
        if(!Sentinel::check()){
            if($request->ajax()){
                return response('Unauthorized.',401);
            }else{
                return redirect()->guest('login');
            }
        }
        return $next($request);
    }
}
