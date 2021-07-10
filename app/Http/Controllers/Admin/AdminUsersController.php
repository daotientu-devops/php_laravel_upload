<?php

namespace App\Http\Controllers\Admin;

use Input;
use Validator;
use Illuminate\Foundation\Validation;
use DB;
use Session;
use Hash;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use App\Http\Requests\AdminUsersEditFormRequest;
use App\Repositories\UserRepositoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Sentinel;

class AdminUsersController extends Controller{
    /**
     * @var $user
     */
    protected $user;
    public function __construct(UserRepositoryInterface $user){
        $this->user=$user;
    }
    /**
     * Display a listing of the resource
     * 
     * @return Response
     */
    public function index(){
       $users=$this->user->getAll();
       $admin=Sentinel::findRoleByName('Admins');
       $c_users=DB::table('users')->count();
       $roles=DB::table('roles')->get();
       return view('protected.admin.list_users')->withUsers($users)->withAdmin($admin)->with('c_users',$c_users)->with('roles',$roles);
    }
    public function create(){
        $rules=array(
            'account_type'=>'integer',
            'email'=>'required|email|unique:users,email',
            'first_name'=>'required',
            'last_name'=>'required',
            'password'=>'required|min:5',
            'password_confirmation'=>'required|min:5|same:password'
        );
        $validator=Validator::make(Input::all(),$rules);
        if($validator->fails()){
            Session::flash('error','Tạo tài khoản thất bại!');//->withErrors($validator);
            return Redirect::to('admin/list_users');
        }else{
            $credentials =[
                    'email'=>Input::get('email'),
                    'first_name'=>Input::get('first_name'),
                    'last_name'=>Input::get('last_name'),
                    'password'=>Input::get('password'),
                    'created_at'=>date('Y-m-d H:i:s')
            ];
            $user=Sentinel::registerAndActivate($credentials);
            $role=Sentinel::findRoleById(Input::get('account_type'));
            $role->users()->attach($user);
            return Redirect::to('admin/list_users')->withFlashMessage('Tạo tài khoản người dùng thành công!');
        }
    }
    /**
     * Update the specified resource in storage
     *
     * @param int $id
     * @return Response
     */
    public function update($id){
        if(trim(Input::get('password'))===''){
            $rules=array(
                'account_type'=>'integer',
                'first_name'=>'required',
                'last_name'=>'required'
            );
            $validator=Validator::make(Input::all(),$rules);
            if($validator->fails()){
                Session::flash('error','Sửa tài khoản thất bại!');
                return Redirect::to('admin/list_users');
            }else{
                DB::table('users')->where('id','=',$id)->update(
                    array(
                        'first_name'=>Input::get('first_name'),
                        'last_name'=>Input::get('last_name')
                    )
                );
                DB::table('role_users')->where('user_id','=',$id)->update(
                    array(
                        'role_id'=>Input::get('account_type')
                    )
                );
                return Redirect::to('admin/list_users')->withFlashMessage('Sửa thông tin người dùng thành công!');
            }
        }else{
            $rules=array(
                'account_type'=>'integer',
                'first_name'=>'required',
                'last_name'=>'required',
                'password'=>'required|min:5',
                'password_confirmation'=>'required|min:5|same:password'
            );
            $validator=Validator::make(Input::all(),$rules);
            if($validator->fails()){
                Session::flash('error','Sửa tài khoản thất bại!');
                return Redirect::to('admin/list_users');
            }else{
                DB::table('users')->where('id','=',$id)->update(
                    array(
                        'first_name'=>Input::get('first_name'),
                        'last_name'=>Input::get('last_name'),
                        'password'=>Hash::make(Input::get('password'))
                    )
                );
                DB::table('role_users')->where('user_id','=',$id)->update(
                    array(
                        'role_id'=>Input::get('account_type')
                    )
                );
                return Redirect::to('admin/list_users')->withFlashMessage('Sửa thông tin người dùng thành công!');
            }
        }
    }
    public function delete($id){
        DB::table('users')->where('id','=',$id)->delete();
        DB::table('role_users')->where('user_id','=',$id)->delete();
        Session::flash('success','Xóa tài khoản thành công!');
        return Redirect::to('admin/list_users');
    }
}