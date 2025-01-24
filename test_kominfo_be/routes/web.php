<?php

use App\Http\Controllers\SubmissionController;
use App\Models\Submission;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});


Route::post('/create-submission', [SubmissionController::class, 'SubmissionController@store']);
