<?php
namespace App\Http\Middleware;
use Closure;
use Illuminate\Contracts\Auth\Guard;
use Sentinel;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class SentinelRedirectIfAuthenticated{
    /**
     * The Guard implementation
     * 
     * @var Guard
     */
    protected $auth;
    /**
     * Create a new filter instance
     * 
     * @param Guard $auth
     * @return void
     */
    public function __construct(Guard $auth) {
        $this->auth=$auth;
    }
    /**
     * Handle an incoming request
     * 
     * @param \Illuminate\Http\Request $request
     * @param \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next){
        if(Sentinel::check()){
            return redirect('/');
        }
        return $next($request);
    }
}

