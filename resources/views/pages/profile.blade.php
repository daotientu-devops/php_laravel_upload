@extends('master')
@section('title','Hồ sơ cá nhân')
@section('content')
<!-- Page header -->
<div class="page-header">
    <div class="page-title">
        <h3>Hồ sơ cá nhân <small>Sửa thông tin cá nhân</small></h3>
    </div>
</div>
<!-- /page header -->
<!-- Breadcrumbs line -->
<div class="breadcrumb-line">
    <ul class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li class="active">Hồ sơ</li>
    </ul>
</div>
<!-- /breadcrumbs line -->


<!-- Profile information -->
{!!Form::open(['url'=>'profiles/update/'.$user->id])!!}
    <h6 class="heading-hr"><i class="icon-user"></i> Thông tin cá nhân:</h6>

    <div class="block-inner">
        @if (session()->has('flash_message'))
        <div class="alert alert-success fade in block-inner">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <i class="icon-checkmark-circle"></i>{{ session()->get('flash_message') }}
        </div>
        @endif
        <div class="form-group">
            <div class="row">
                <div class="col-md-6">
                    <label>Tên:</label>
                    {!! Form::text('first_name', $user->first_name, ['class' => 'form-control']) !!}
                    {!! errors_for('first_name', $errors) !!}
                </div>
                <div class="col-md-6">
                    <label>Họ và tên đệm:</label>
                    {!! Form::text('last_name', $user->last_name, ['class' => 'form-control']) !!}
                    {!! errors_for('last_name', $errors) !!}
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-md-6">
                    <label>Email:</label>
                    {!! Form::email('email', $user->email, ['class' => 'form-control','readonly'=>'readonly']) !!}
                    {!! errors_for('email', $errors) !!}
                </div>
            </div>
        </div>
    </div>


    <h6 class="heading-hr"><i class="icon-lock"></i> Thay đổi mật khẩu:</h6>

<!--    <div class="form-group">
        <div class="row">
            <div class="col-md-6">
                <label>Mật khẩu hiện tại:</label>
                <input type="password" value="password" readonly="readonly" class="form-control">
            </div>
        </div>
    </div>-->

    <div class="form-group">
        <div class="row">
            <div class="col-md-6">
                <label>Mật khẩu mới:</label>
                {!! Form::password('password', ['class' => 'form-control']) !!}
                <p class="help-block">Mật khẩu không được phép để trống.</p>
                {!! errors_for('password', $errors) !!}
            </div>
            <div class="col-md-6">
                <label>Nhắc lại mật khẩu:</label>
                {!! Form::password('password_confirmation', ['class' => 'form-control'] )!!}
            </div>
        </div>
    </div>

    <div class="text-right">
        <input type="reset" value="Làm lại" class="btn btn-default">
        <input type="submit" value="Lưu thay đổi" class="btn btn-success">
    </div>

{!!Form::close()!!}
<!-- /profile information -->
<br/>
@endsection