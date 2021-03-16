@extends('layouts.app')

@section('content')

<div class="m-portlet m-portlet--mobile">
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
                                <a href="{{ route('user.edit', $user->id) }}" class="m-portlet__nav-link btn m-btn m-btn--hover-accent m-btn--icon m-btn--icon-only m-btn--pill" title="{{ __('app.edit_details') }}">
                                    <button class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill">edit</button>
                                </a>

                                <form action="{{ route('user.destroy', $user->id) }}" method="POST" class="" style="display:inline">
                                    {{csrf_field()}}
                                    <input name="_method" type="hidden" value="DELETE">
                                    <button onclick="return confirm('{{ __('are you sure?') }}')" type="submit" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill"><i class="la la-trash">Delete</i></button>
                                </form>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        {{-- </div> --}}
    </div>
</div>
<a href="{{ url('/user/create') }}" class="btn btn-xs btn-info pull-right">add User</a>
<form action="{{ url('/user/excel') }}" method="POST" enctype="multipart/form-data" class="d-flex">
    @csrf
    <input type="file" name="file">
    <button onclick="return confirm('{{ __('are you sure?') }}')" type="submit" class="m-portlet__nav-link btn m-btn m-btn--hover-danger m-btn--icon m-btn--icon-only m-btn--pill"><i class="la la-trash">submit</i></button>
</form>
@endsection