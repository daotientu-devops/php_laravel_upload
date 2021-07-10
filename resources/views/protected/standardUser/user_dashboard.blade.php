@extends('master')
@section('title','Bảng điều khiển')
@section('content')
<!-- Page header -->
<div class="page-header">
    <div class="page-title">
        <h3>Bảng điều khiển <small>Chào mừng Eugene</small></h3>
    </div>
</div>
<!-- /page header -->


<!-- Breadcrumbs line -->
<div class="breadcrumb-line">
    <ul class="breadcrumb">
        <li><a href="{{url('/')}}">Trang chủ</a></li>
        <li class="active">Bảng điều khiển</li>
    </ul>

    <div class="visible-xs breadcrumb-toggle">
        <a class="btn btn-link btn-lg btn-icon" data-toggle="collapse" data-target=".breadcrumb-buttons"><i class="icon-menu2"></i></a>
    </div>
</div>
<!-- /breadcrumbs line -->
<!-- Callout -->
<div class="callout callout-info fade in">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <h5>Landing page</h5>
    <p></p>
</div>
<!-- /callout -->
@endsection
