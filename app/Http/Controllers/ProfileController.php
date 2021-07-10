<?php
namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Http\Requests;

use App\Repositories\UserRepositoryInterface;
use Illuminate\Http\Request;

use DB;
use Illuminate\Support\Facades\Hash;
use Input;
use Validator;
use Session;
use Redirect;

class ProfileController extends Controller{
    /**
     * @var $user
     */
    protected $user;
    public function __construct(UserRepositoryInterface $user){
        $this->user=$user;
    }
    /**
     * Show the form for creating a new resource
     * 
     * @return Response
     */
    public function create(){
        return view('pages.profile');
    }
    public function show($id){
        $user=DB::table('users')->find($id);
        return view('pages.profile',['user'=>$user]);
    }
    /**
     * Store a newly created resource in storage
     * 
     * @return Response
     */
    public function update($id){
        if(trim(Input::get('password'))===''){
            $rules=array(
                'first_name'=>'required',
                'last_name'=>'required'
            );
            $validator=Validator::make(Input::all(),$rules);
            if($validator->fails()){
                Session::flash('error','Sửa hồ sơ thất bại!');
                return redirect()->route('profiles.show',$id);
            }else{
                DB::table('users')->where('id','=',$id)->update(
                    array(
                        'first_name'=>Input::get('first_name'),
                        'last_name'=>Input::get('last_name')
                    )
                );
                return redirect()->route('profiles.show',$id)->withFlashMessage('Hồ sơ được cập nhật thành công!');
            }
        }else{
            $rules=array(
                'first_name'=>'required',
                'last_name'=>'required',
                'password'=>'required|min:5',
                'password_confirmation'=>'required|min:5|same:password'
            );
            $validator=Validator::make(Input::all(),$rules);
            if($validator->fails()){
                Session::flash('error','Sửa hồ sơ thất bại!');
                return Redirect::to('admin/list_users');
            }else{
                DB::table('users')->where('id','=',$id)->update(
                    array(
                        'first_name'=>Input::get('first_name'),
                        'last_name'=>Input::get('last_name'),
                        'password'=>Hash::make(Input::get('password'))
                    )
                );
                return redirect()->route('profiles.show',$id)->withFlashMessage('Hồ sơ được cập nhật thành công!');
            }
        }
    }
}

