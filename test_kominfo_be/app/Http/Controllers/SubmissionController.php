<?php

namespace App\Http\Controllers;

use App\Models\Submission;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SubmissionController extends Controller
{
    public function index()
    {
        $submissions = Submission::all();
        return view('submissions.index', compact('submissions'));
    }

    public function create()
    {
        return view('submissions.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'timeline' => 'required',
            'nik' => 'nullable',
            'name' => 'nullable',
            'hp' => 'nullable',
            'email' => 'nullable',
            'address' => 'nullable',
            'description' => 'nullable',
            'attachment' => 'nullable|file'
        ]);

        $submission = Submission::create($request->all());

        if ($request->hasFile('attachment')) {
            $submission->attachment = $request->file('attachment')->store('submissions');
            $submission->save();
        }

        return redirect()->route('submissions.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Submission $submission)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Submission $submission)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Submission $submission)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Submission $submission)
    {
        //
    }
}
