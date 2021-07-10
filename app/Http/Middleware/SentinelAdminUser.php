<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
namespace App\Http\Middleware;
use Closure;
use Sentinel;

class SentinelAdminUser{
    /**
     * Handle an incoming request
     * 
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next){
        $user=Sentinel::getUser();
        $admin=Sentinel::findRoleByName('Admins');
        if(is_null($user)){
            return redirect('login');
        }else{
            if(!$user->inRole($admin)){
                return redirect('login');
            }
        }
        return $next($request);
    }
}
