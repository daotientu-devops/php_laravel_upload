<?php
namespace App\Http\Controllers\StandardUser;

namespace App\Http\Controllers\StandardUser;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
class StandardUserController extends Controller{
    public function getHome(){
        return view('protected.standardUser.user_dashboard');
    }
    public function getUserProtected(){
        return view('protected.standardUser.userPage');
    }
}

