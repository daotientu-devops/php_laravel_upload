<?php

namespace App\Http\Controllers\StandardUser;

use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Http\Requests\UsersEditFormRequest;
use App\Repositories\UserRepositoryInterface;
use Illuminate\Http\Request;

class UsersController extends Controller{
    /**
     * @var $user
     */
    protected $user;
    public function __construct(UserRepositoryInterface $user){
        $this->user=$user;
        $this->middleware('notCurrentUser',['only'=>['show','update']]);
    }
}

