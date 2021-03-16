@extends('layouts.app')

@section('content')
<div class="m-portlet m-portlet--mobile">
    {{ Form::model($user, ['route' => ['user.update', 'id' => $user->id], 'method' => 'PUT', 'class' => 'm-form m-form--fit m-form--label-align-right']) }}
    <div class="m-portlet__body">
        <div class="form-group m-form__group">
            {{ Form::label('name', __('Name'))}} <label style="color:red;">*</label>
            {{ Form::text('name', null, ['class' => 'form-control border-secondary', 'autofocus']) }}
        </div>
        <div class="form-group m-form__group">
            {{ Form::label('email', __('Email')) }} <label style="color:red;">*</label>
            {{ Form::email('email', null, ['class' => 'form-control border-secondary']) }}
        </div>
    </div>
    <div class="m-portlet__foot m-portlet__foot--fit">
        <div class="m-form__actions">
            {{ Form::submit(__('submit'), ['class' => 'btn btn-primary']) }}
            <a href="{{ route('user.index') }}" class="btn btn-default">{{ __('cancel') }}</a>
        </div>
    </div>
    {{ Form::close() }}
</div>
@endsection
