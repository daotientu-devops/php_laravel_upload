<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
        <title>Đăng nhập</title>
        <link rel="shortcut icon" href="{{url('css/icons/ic_file_upload.ico')}}">
        {!!HTML::style('css/bootstrap.min.css')!!}
        {!!HTML::style('css/londinium-theme.css')!!}
        {!!HTML::style('css/styles.css')!!}
        {!!HTML::style('css/icons.css')!!}

    </head>

    <body class="full-width page-condensed">

        <!-- Navbar -->
        <div class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-right">
                    <span class="sr-only">Toggle navbar</span>
                    <i class="icon-grid3"></i>
                </button>
                <a class="navbar-brand" href="#">Upload</a>
            </div>
        </div>
        <!-- /navbar -->


        <!-- Login wrapper -->
        <div class="login-wrapper">
            {!!Form::open(['route'=>'sessions.store'])!!}
            <div class="popup-header">
                <a href="#" class="pull-left"><i class="icon-user"></i></a>
                <span class="text-semibold">Tài khoản đăng nhập</span>
            </div>
            <div class="well">
                @if(session()->has('flash_message'))
                <div class="alert alert-success fade in block-inner">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <i class="icon-checkmark-circle"></i> {{session()->get('flash_message')}}
                </div>
                @endif
                @if(session()->has('error_message'))
                <div class="alert alert-danger fade in block-inner">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <i class="icon-cancel-circle"></i> {{session()->get('error_message')}}
                </div>
                @endif
                <div class="form-group has-feedback">
                    <label>Email</label>
                    {!!Form::text('email',null,['placeholder'=>'','class'=>'form-control','required'=>'required'])!!}
                    <i class="icon-envelop form-control-feedback"></i>
                    {!!errors_for('email',$errors)!!}
                </div>

                <div class="form-group has-feedback">
                    <label>Mật khẩu</label>
                    {!!Form::password('password',['placeholder'=>'','class'=>'form-control','required'=>'required'])!!}
                    <i class="icon-lock form-control-feedback"></i>
                    {!!errors_for('password',$errors)!!}
                </div>

                <div class="row form-actions">
                    <div class="col-xs-6">
                        <div class="checkbox checkbox-success">
                            <label>
                                <input type="checkbox" class="styled">
                                Ghi nhớ mật khẩu
                            </label>
                        </div>
                    </div>

                    <div class="col-xs-6">
                        <button type="submit" class="btn btn-warning pull-right"><i class="icon-menu2"></i> Đăng nhập</button>
                    </div>
                </div>
            </div>
            {!!Form::close()!!}
        </div>  
        <!-- /login wrapper -->


        <!-- Footer -->
        <div class="footer clearfix">
            <div class="pull-left">&copy; <?php echo date('Y'); ?>. Upload by iNews</div>
        </div>
        <!-- /footer -->


    </body>
</html>