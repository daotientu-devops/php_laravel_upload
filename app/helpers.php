<?php
function errors_for($attribute,$errors){
    return $errors->first($attribute,'<p class="text-danger">:message</p>');
}
function set_active($path,$active='active'){
    return Request::is($path)?$active:'';
}
function set_active_dashboard($path,$active='active'){
    return Request::is('/')||Request::is('admin')||Request::is('user')?$active:'';
}
function set_active_profile($path,$active='active'){
    return Request::is($path)||Request::is($path.'/*')?$active:'';
}
