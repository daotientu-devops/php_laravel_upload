<?php
namespace App\Repositories;
use App\User;
use \DB;
use \Sentinel;
class DbUserRepository implements UserRepositoryInterface{
    public function create($fields) {
        return Sentinel::create($fields);
    }

    public function find($id) {
        return User::findOrFail($id);
    }

    public function getAll() {
        return User::all();
    }

    public function updateRole($user_id, $role_id) {
        DB::table('role_users')->where('user_id',$user_id)->update(['role_id'=>$role_id]);
    }

}
