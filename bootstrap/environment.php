<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function extract_domain($domain) {
    if (preg_match("/(?P<domain>[a-z0-9][a-z0-9\-]{1,63}\.[a-z\.]{2,6})$/i", $domain, $matches)) {
        return $matches['domain'];
    } else {
        return $domain;
    }
}

function extract_subdomains($domain) {
    $subdomains = $domain;
    $domain = extract_domain($subdomains);
    $subdomains = rtrim(strstr($subdomains, $domain, true), '.');
    return $subdomains;
}

/*
  |--------------------------------------------------------------------------
  | Detect The Application Environment
  |--------------------------------------------------------------------------
  |
 */
$domainName = isset($_SERVER['HTTP_HOST']) ? $_SERVER['HTTP_HOST'] : 'tintuc.vn';
$domain = extract_domain($domainName);
$subdomain = extract_subdomains($domainName);
$correctSubs = array(
    'lupload',
    'supload',
    'upload'
);
if (!in_array($subdomain, $correctSubs)) {
    $subdomain = '';
}
$name='local';
if (in_array($subdomain, $correctSubs)) {
    if ($subdomain === 'lupload') {
        $name = 'local';
    } elseif ($subdomain === 'supload') {
        $name = 'staging';
    } elseif ($subdomain === 'upload') {
        $name = 'production';
    } else {
        $name = 'local';
    }
}
$env = $app->detectEnvironment(function () {
    global $name;
    $environmentPath = __DIR__ . '/../.' . $name . '.env';
    $setEnv = trim(file_get_contents($environmentPath));
    if (file_exists($environmentPath)) {
        putenv("APP_ENV=$setEnv");
        if (getenv('APP_ENV') && file_exists(__DIR__ . '/../.' . $name . '.env')) {
            Dotenv::load(__DIR__ . '/../', '.' . $name . '.env');
        }
    }
});
