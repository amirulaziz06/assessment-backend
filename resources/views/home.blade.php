@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    You are logged in!
                </div>
            </div>
        </div>
    </div>
</div>

<a href="{{ url('/user') }}" class="btn btn-xs btn-info pull-right">User</a>
{{-- <button type="user" name="user">User</button> --}}

{{-- <div class="m-portlet m-portlet--mobile">
    <div class="m-portlet__body">
        <!--<div class="table-responsive">-->
            <table class="table mdatatable">
                <thead>
                    <tr>
                        <th>{{ __('No') }}</th>
                        <th>{{ __('Username') }}</th>
                        <th>{{ __('Email') }}</th>
                        <th>{{ __('Action') }}</th>
                    </tr>
                </thead>
                <tbody>
                <tbody>
                    @foreach($users as $user)
                        <tr>
                            <td>{{ $user->id }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>
                                <div class="btn-group"  style="display: inline-block;">
                                <a href="{{ route('edit', $user->id) }}" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="{{ __('app.edit_details') }}">
                                    <i class="la la-edit">edit</i>
                                </a>

                                <form id="delete_from_{{$user->id}}" action="{{ route('destroy', $user->id) }}" method="POST">
                                    @method('DELETE')
                                    @csrf
                                    <a href="javascript:void(0);" data-id="{{$user->id}}" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill _delete_data">
                                        <i class="la la-trash">delete</i>
                                    </a>
                                </form>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
    </div>
</div> --}}
@endsection 
