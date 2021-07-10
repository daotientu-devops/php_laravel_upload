@extends('master')
@section('title','Danh sách người dùng')
@section('content')
<!-- Page header -->
<div class="page-header">
    <div class="page-title">
        <h3>Danh sách người dùng
            <small>Thống kê tài khoản</small>
        </h3>
    </div>
</div>
<!-- /page header -->


<!-- Breadcrumbs line -->
<div class="breadcrumb-line">
    <ul class="breadcrumb">
        <li><a href="{{url('admin')}}">Trang chủ</a></li>
        <li class="active">Danh sách người dùng</li>
    </ul>
</div>
<!-- /breadcrumbs line -->
<!-- Table view -->
@if(session()->has('flash_message'))
<div class="alert alert-success fade in block-inner">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <i class="icon-checkmark-circle"></i> {{session()->get('flash_message')}}
</div>
@endif
@if (session()->has('error'))
<div class="alert alert-danger fade in block-inner">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <i class="icon-cancel-circle"></i>{{ session()->get('error') }}
</div>
@endif
<div class="panel panel-default">
<div class="panel-heading">
    <h5 class="panel-title"><i class="icon-people"></i> Thành viên</h5>
    <span class="label label-info pull-right">{{$c_users}}</span>
</div>
<div class="datatable-media">
<a data-toggle="modal" role="button" href="#create_new_user">
    <button class="btn btn-success margin-10" type="button"><i class="icon-plus-circle"></i> Thêm mới</button>
</a>
<!-- Form modal -->
<div id="create_new_user" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title"><i class="icon-plus-circle2"></i> Dữ liệu</h4>
            </div>

            <!-- Form inside modal -->
            {!! Form::open(['route' => 'user.create']) !!}

            <div class="modal-body with-padding">
                <div class="block-inner text-danger">
                    <h6 class="heading-hr">Thêm mới người dùng
                        <small class="display-block"></small>
                    </h6>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>Quyền</label>
                            <select name="account_type" class="form-control">
                                @foreach($roles as $role)
                                <option value="{{$role->id}}">{{$role->name}}</option>
                                @endforeach
                            </select>
                            {!! errors_for('account_type', $errors) !!}
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <!-- First name field -->
                        <div class="col-sm-6">
                            <label>Tên</label>
                            {!! Form::text('first_name', null, ['placeholder' => '', 'class' => 'form-control',
                            'required' => 'required'])!!}
                            {!! errors_for('first_name', $errors) !!}
                        </div>
                        <!-- Last name field -->
                        <div class="col-sm-6">
                            <label>Họ và tên đệm</label>
                            {!! Form::text('last_name', null, ['placeholder' => '', 'class' => 'form-control',
                            'required' => 'required'])!!}
                            {!! errors_for('last_name', $errors) !!}
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>Email</label>
                            {!! Form::text('email', null, ['placeholder' => '', 'class' => 'form-control', 'required' =>
                            'required'])!!}
                            {!! errors_for('email', $errors) !!}
                            <span class="help-block">name@domain.com</span>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>Mật khẩu</label>
                            {!! Form::password('password', ['placeholder' => '', 'class' => 'form-control', 'required'
                            => 'required'])!!}
                            {!! errors_for('password', $errors) !!}
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="row">
                        <div class="col-sm-6">
                            <label>Nhắc lại mật khẩu</label>
                            {!! Form::password('password_confirmation', ['placeholder' => '', 'class' => 'form-control',
                            'required' => 'required'])!!}
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal"><i class="icon-cancel-circle"></i>
                    Hủy bỏ
                </button>
                <button type="submit" class="btn btn-primary"><i class="icon-checkmark-circle"></i> Lưu lại</button>
            </div>

            {!!Form::close()!!}
        </div>
    </div>
</div>
<!-- /form modal -->
<table class="table table-bordered table-striped">
    <thead>
    <tr>
        <th>ID</th>
        <th>Tài khoản</th>
        <th>Quyền</th>
        <th class="text-center">Thao tác</th>
    </tr>
    </thead>
    <tbody>
    @foreach ($users as $user)
    <?php
        $user_role = DB::table('role_users')->where('user_id','=',$user->id)->first()->role_id;
    ?>
    <tr>
        <td>{{ $user->id }}</td>
        <td><a data-toggle="modal" role="button" href="#edit_user_{{ $user->id }}">{{ $user->email }}</a> <br>
        </td>
        <td>
            @foreach($roles as $role)
            @if($user_role===$role->id)
            {{$role->name}}
            @else
            @endif
            @endforeach
        </td>
        <td class="text-center">
            <div class="icons-group">
                <a data-toggle="modal" role="button" href="#edit_user_{{$user->id}}">
                    <button class="btn btn-warning" type="button"><i class="icon-pencil3"></i> Sửa</button>
                </a>
                <a data-toggle="modal" role="button" href="#delete_user_{{$user->id}}">
                    <button class="btn btn-danger" type="button"><i class="icon-cancel-circle"></i> Xóa</button>
                </a>
            </div>
        </td>
    </tr>
    <!-- Form modal -->
    <div id="edit_user_{{$user->id}}" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="icon-pen2"></i> Dữ liệu</h4>
                </div>
                <!-- Form inside modal -->
                {!! Form::open(['url' => 'admin/list_users/user-update/'.$user->id]) !!}

                <div class="modal-body with-padding">
                    <div class="block-inner text-danger">
                        <h6 class="heading-hr">Sửa thông tin người dùng
                            <small class="display-block"></small>
                        </h6>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Quyền</label>
                                <select name="account_type" class="form-control">
                                    @foreach($roles as $role)
                                    @if($user_role===$role->id)
                                    <option value="{{$role->id}}" selected="selected">{{$role->name}}</option>
                                    @else
                                    <option value="{{$role->id}}">{{$role->name}}</option>
                                    @endif
                                    @endforeach
                                </select>
                                {!! errors_for('account_type', $errors) !!}
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Tên</label>
                                {!! Form::text('first_name', $user->first_name, ['class' => 'form-control']) !!}
                                {!! errors_for('first_name', $errors) !!}
                            </div>

                            <div class="col-sm-6">
                                <label>Họ và tên đệm</label>
                                {!! Form::text('last_name', $user->last_name, ['class' => 'form-control']) !!}
                                {!! errors_for('last_name', $errors) !!}
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Email</label>
                                {!! Form::email('email', $user->email, ['class' => 'form-control']) !!}
                                <span class="help-block">name@domain.com</span>
                                {!! errors_for('email', $errors) !!}
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Mật khẩu</label>
                                {!! Form::password('password',['class' => 'form-control']) !!}
                                <p class="help-block">Mật khẩu không được phép để trống.</p>
                                {!! errors_for('password', $errors) !!}
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <label>Nhắc lại mật khẩu</label>
                                {!! Form::password('password_confirmation', ['class' => 'form-control'] )!!}
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal"><i
                            class="icon-cancel-circle"></i> Hủy bỏ
                    </button>
                    <button type="submit" class="btn btn-primary"><i class="icon-checkmark-circle"></i> Lưu lại</button>
                </div>

                {!!Form::close()!!}
            </div>
        </div>
    </div>
    <!-- /form modal -->
    <!-- Small modal -->
    <div id="delete_user_{{$user->id}}" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title"><i class="icon-cancel-circle2"></i> Xác nhận</h4>
                </div>
                {!!Form::open(['url'=>'admin/list_users/user-delete/'.$user->id])!!}
                <div class="modal-body with-padding">
                    <p>
                        Bạn có chắc chắn muốn xóa tài khoản này không?<br/>
                        {{$user->email}}<br/>
                        Ngày tạo:&nbsp;{{$user->created_at}}
                    </p>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-warning" data-dismiss="modal">Hủy bỏ</button>
                    <button class="btn btn-primary">Đồng ý</button>
                </div>
                {!!Form::close()!!}
            </div>
        </div>
    </div>
    <!-- /small modal -->

    @endforeach
    </tbody>
</table>
</div>
</div>
<!-- /table view -->
@endsection