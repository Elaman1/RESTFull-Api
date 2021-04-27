<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use App\Models\User;

class Record extends Model
{
    protected $fillable = [
        'heading', 'text', 'user_id'
    ];

}
