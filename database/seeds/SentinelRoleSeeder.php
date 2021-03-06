<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class SentinelRoleSeeder extends Seeder {

    /**
     * Ru the database seeds.
     * 
     * @return void
     */
    public function run() {
        DB::table('roles')->delete();
        Sentinel::getRoleRepository()->createModel()->create([
            'name'=>'Users',
            'slug'=>'users',
        ]);
        Sentinel::getRoleRepository()->createModel()->create([
            'name'=>'Admins',
            'slug'=>'admins',
        ]);
        $this->command->info('Roles seeded!');
    }

}
