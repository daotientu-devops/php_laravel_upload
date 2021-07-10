<?php
namespace App\Http\Middleware;

use Closure;
use Sentinel;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class SentinelRedirectAdmin{
    /**
     * Handle an incoming request
     * 
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next){
        if(Sentinel::check()){
            $user=Sentinel::getUser();
            $admin=Sentinel::findRoleByName('Admins');
            
            if($user->inRole($admin)){
                return redirect('admin');
            }
        }
        return $next($request);
    }
}