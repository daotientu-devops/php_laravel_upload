@extends('master')
@section('title','Upload ảnh')
@section('content')
<!-- Page header -->
<div class="page-header">
    <div class="page-title">
        <h3>Upload file ảnh <small>Hỗ trợ các file (.png, .jpg, .jpeg, .gif)</small></h3>
    </div>
</div>
<!-- /page header -->


<!-- Breadcrumbs line -->
<div class="breadcrumb-line">
    <ul class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li class="active">Upload file ảnh</li>
    </ul>
</div>
<!-- /breadcrumbs line -->
<div class="panel panel-default">
    <div class="panel-body">
        <div class="row">
            <div class="col-md-12">

                <!-- Default buttons -->
                <div class="block">
                    @if (session()->has('success'))
                    <div class="alert alert-success fade in block-inner">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <i class="icon-checkmark-circle"></i>{{ session()->get('success') }}
                    </div>
                    @endif
                    @if (session()->has('error'))
                    <div class="alert alert-danger fade in block-inner">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <i class="icon-cancel-circle"></i>{{ session()->get('error') }}
                    </div>
                    @endif
                    {!!Form::open(array('url'=>'upload','method'=>'POST','files'=>true))!!}
                        <!-- Change size of whole widget (e.g. bootstrap input group styling)  and set max files count 
                             allowed to 10. -->
                        <input id="input-5" type="file" name="image_file" class="file"/>
                        {!! errors_for('image_file', $errors) !!}
                        <br/>
<!--                        <button type="reset" class="btn btn-warning" data-dismiss="modal"><i class="icon-cancel-circle"></i> Hủy bỏ</button>-->
<!--                        <button type="submit" class="btn btn-primary"><i class="icon-checkmark-circle"></i> Upload file</button>-->
                    {!!Form::close()!!}
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

