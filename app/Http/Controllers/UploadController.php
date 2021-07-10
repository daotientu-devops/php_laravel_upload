<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Input;
use Validator;
use Redirect;
use Illuminate\Http\Request;
use Session;
use Sentinel;

class UploadController extends Controller {

    public function generateRandomString($length) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyz';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {//random character
            $randomString.=$characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    public function index() {
        return view('pages.upload');
    }

    //http://tutsnare.com/upload-files-in-laravel/
    //http://php.net/manual/en/function.getimagesize.php
    //http://media.tintuc.vn/uploads/medias/2015/07/24/680x365_crop/thuong-tuong-nguyen-thanh-cung-kiem-tra-cac-luc-luong-tham-gia-dieu-bb-baaad55SwU.JPG
    public function upload() {
        $path = 'uploads/medias'; //upload path
        $yearDir = date('Y');
        $monthDir = date('m');
        $dayDir = date('d');
        //getting all of the post data
        $file = array('image' => Input::file('image_file'));
        //setting up rules
        $rules = array('image' => 'required'); //mimes:jpeg,bmp,png and for max size: 10000
        //doing the validation, passing post data, rules and the messages
        $validator = Validator::make($file, $rules);
        if ($validator->fails()) {
            //send back to the page with the input data and errors
            return Redirect::to('upload')->withInput()->withErrors($validator);
        } else {
            list($width, $height) = getimagesize(Input::file('image_file'));
            $dimension = $width.'x'.$height.'_crop';
            $destinationPath = $path . '/' . $yearDir . '/' . $monthDir . '/' . $dayDir.'/'.$dimension;
            if (!file_exists($destinationPath)) {
                mkdir($destinationPath, 0777, true);
            }
            //checking file is valid
            if (Input::file('image_file')->isValid()) {
                $image_name=explode('.',Input::file('image_file')->getClientOriginalName())[0];
                $fileName = $image_name.'-bb-'.$this->generateRandomString(10).'.'.Input::file('image_file')->getClientOriginalExtension(); //renameing image
                Input::file('image_file')->move($destinationPath, $fileName); //uploading file to given path
                DB::table('uploads')->insert(
                    array(
                        'name'=>$image_name,
                        'type'=>Input::file('image_file')->getClientOriginalExtension(),
                        'width'=>$width,
                        'height'=>$height,
                        'path'=>$destinationPath,
                        'user_id'=>Sentinel::getUser()->id,
                        'created_at'=>date('Y-m-d H:i:s')
                    )
                );
                //sending back with message
                Session::flash('success', 'Upload file thành công!');
            } else {
                //sending back with error message
                Session::flash('error', 'Upload file thất bại!');
            }
            return Redirect::to('upload');
        }
    }

//Getting uploaded file :-
//
//
//$file = Input::file('image');
//Check file was uploaded :-
//
//
//if (Input::hasFile('image')) { }
//Check uploaded file is valid :-
//
//
//if (Input::file('image')->isValid()) { }
//Moving uploaded file :-
//
//$destinationPath = ‘your path to upload file’ and $fileName = ‘giving a new name to file’
//
//
//Input::file('image')->move($destinationPath);
//Input::file('image')->move($destinationPath, $fileName);
//Getting path of uploaded file :-
//
//
//$path = Input::file('image')->getRealPath();
//Getting original name of uploaded file :-
//
//
//$name = Input::file('image')->getClientOriginalName();
//Getting extension Of uploaded file :-
//
//
//$extension = Input::file('image')->getClientOriginalExtension();
//Getting size of An uploaded file :-
//
//
//$size = Input::file('image')->getSize();
//Getting MIME Type of uploaded file :-
//
//
//$mime = Input::file('image')->getMimeType();
}
