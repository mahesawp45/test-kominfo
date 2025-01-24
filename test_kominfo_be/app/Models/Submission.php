<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Submission extends Model
{
    protected $fillable = [
        'timeline',
        'nik',
        'name',
        'hp',
        'email',
        'address',
        'description',
        'attachment',
        'admin_verified'
    ];
}
