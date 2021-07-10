<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1">
        <title>@yield('title') - Upload</title>
        <!-- Favicon and Apple Icons -->
        <link rel="shortcut icon" href="{{url('css/icons/ic_file_upload.ico')}}">
        {!!HTML::style('css/bootstrap.min.css')!!}
        {!!HTML::style('css/londinium-theme.css')!!}
        {!!HTML::style('css/styles.css')!!}
        {!!HTML::style('css/icons.css')!!}
        {!!HTML::style('css/fileinput.min.css')!!}
        <link rel="stylesheet/less" type="text/css" href="{{url('css/styles.less')}}">

        {!!HTML::script('js/jquery.min.js')!!}
        {!!HTML::script('js/jquery-ui.min.js')!!}
        {!!HTML::script('js/fileinput.min.js')!!}

        {!!HTML::script('js/plugins/charts/sparkline.min.js')!!}
        {!!HTML::script('js/plugins/forms/uniform.min.js')!!}
        {!!HTML::script('js/plugins/forms/select2.min.js')!!}
        {!!HTML::script('js/plugins/forms/inputmask.js')!!}
        {!!HTML::script('js/plugins/forms/autosize.js')!!}
        {!!HTML::script('js/plugins/forms/inputlimit.min.js')!!}
        {!!HTML::script('js/plugins/forms/listbox.js')!!}
        {!!HTML::script('js/plugins/forms/multiselect.js')!!}
        {!!HTML::script('js/plugins/forms/validate.min.js')!!}
        {!!HTML::script('js/plugins/forms/tags.min.js')!!}
        {!!HTML::script('js/plugins/forms/switch.min.js')!!}

        {!!HTML::script('js/plugins/forms/uploader/plupload.full.min.js')!!}
        {!!HTML::script('js/plugins/forms/uploader/plupload.queue.min.js')!!}

        {!!HTML::script('js/plugins/forms/wysihtml5/wysihtml5.min.js')!!}
        {!!HTML::script('js/plugins/forms/wysihtml5/toolbar.js')!!}

        {!!HTML::script('js/plugins/interface/daterangepicker.js')!!}
        {!!HTML::script('js/plugins/interface/fancybox.min.js')!!}
        {!!HTML::script('js/plugins/interface/moment.js')!!}
        {!!HTML::script('js/plugins/interface/jgrowl.min.js')!!}
        {!!HTML::script('js/plugins/interface/datatables.min.js')!!}
        {!!HTML::script('js/plugins/interface/colorpicker.js')!!}
        {!!HTML::script('js/plugins/interface/fullcalendar.min.js')!!}
        {!!HTML::script('js/plugins/interface/timepicker.min.js')!!}

        {!!HTML::script('js/bootstrap.min.js')!!}
        {!!HTML::script('js/application.js')!!}
        {!!HTML::script('js/less.js')!!}
    </head>

    <body>
        <?php
        $user = Sentinel::getUser();
        $admin = Sentinel::findRoleByName('Admins');
        $users = Sentinel::findRoleByName('Users');
        ?>
        <!-- Navbar -->
        <div class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <a class="navbar-brand" href="{{url('/')}}">Upload</a>
                <a class="sidebar-toggle"><i class="icon-paragraph-justify2"></i></a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-icons">
                    <span class="sr-only">Toggle navbar</span>
                    <i class="icon-grid3"></i>
                </button>
                <button type="button" class="navbar-toggle offcanvas">
                    <span class="sr-only">Toggle navigation</span>
                    <i class="icon-paragraph-justify2"></i>
                </button>
            </div>

            <ul class="nav navbar-nav navbar-right collapse" id="navbar-icons">
                <li class="user dropdown {{set_active_profile('profiles')}}">
                    <a class="dropdown-toggle" data-toggle="dropdown">
                        <span>{{$user->email}}</span>
                        <i class="caret"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right icons-right">
                        <li><a href="{{url('profiles')}}/{{Sentinel::getUser()->id}}"><i class="icon-user"></i> Profile</a></li>
                        <li><a href="{{url('logout')}}"><i class="icon-exit"></i> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /navbar -->
        <!-- Page container -->
        <div class="page-container">


            <!-- Sidebar -->
            <div class="sidebar">
                <div class="sidebar-content">

                    <!-- User dropdown -->
                    <div class="user-menu dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <div class="user-info">
                                Chào mừng {{$user->first_name}} {{$user->last_name}}
                            </div>
                        </a>
                    </div>
                    <!-- /user dropdown -->


                    <!-- Main navigation -->
                    <ul class="navigation">
                        <li class="{{set_active_dashboard('/')}}"><a href="{{url('admin')}}"><span>Bảng điều khiển</span> <i class="icon-screen2"></i></a></li>
                        @if($user->inRole($admin))
                        <li class="{{set_active('admin/list_users')}}">
                            <a href="{{url('admin/list_users')}}"><span>Người dùng</span> <i class="icon-user"></i></a>
                        </li>
                        @else
                        @endif
                        <li class="{{set_active('upload')}}">
                            <a href="{{url('upload')}}"><span>Upload ảnh</span> <i class="icon-images"></i></a>
                        </li>
                    </ul>
                    <!-- /main navigation -->

                </div>
            </div>
            <!-- /sidebar -->
            <!-- Page content -->
            <div class="page-content">
                @yield('content')
                <!-- Footer -->
                <div class="footer clearfix">
                    <div class="pull-left">&copy; <?php echo date('Y'); ?>. Upload by iNews</div>
                </div>
                <!-- /footer -->
            </div>
            <!-- /page content -->
        </div>
        <!-- /content -->
    </body>
</html>

