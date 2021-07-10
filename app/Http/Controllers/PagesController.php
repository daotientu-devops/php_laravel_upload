<?php

namespace App\Http\Controllers;
use Sentinel;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class PagesController extends Controller {

    public function getHome() {
        $user = Sentinel::getUser();
        $admin = Sentinel::findRoleByName('Admins');
        $users = Sentinel::findRoleByName('Users');
        if(is_null($user)){
            return view('sessions.create');
        }else{
            if($user->inRole($admin)){
                return view('protected.admin.admin_dashboard');
            }else{
                return view('protected.standardUser.user_dashboard');
            }
        }
    }

}
