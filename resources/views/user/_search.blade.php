<div class="m-portlet m-portlet--mobile">
    <div><h3>{{ __('Search Filter')}} </h3></div>
    <form action="{{ route('user.index') }}" method="GET" class="m-form m-form--fit m-form">
        <div class="m-portlet__body">
            {{-- csrf_field() --}}
            @if (request()->input('page'))
            <input type="hidden" class="form-control m-input m-input--solid" name="page" value="{{request()->input('page')}}"/>
            @endif
            <div class="form-group m-form__group row">
                <label class="col-12 col-sm-2  col-form-label">{{ __('Name') }}</label>
                <div class="col-12 col-sm-6">
                    <input name="name" class="form-control m-input m-input border-secondary" type="text" value="{{ (request()->input('name')) ? request()->input('name') : old('name') }}" />
                </div>
            </div>
            <div class="form-group m-form__group row">
                <label class="col-12 col-sm-2  col-form-label">{{ __('Email') }}</label>
                <div class="col-12 col-sm-6">
                    <input name="email" class="form-control m-input m-input border-secondary" type="text" value="{{ (request()->input('email')) ? request()->input('email') : old('email') }}" />
                </div>
            </div>
        </div>
        <div class="m-portlet__foot m-portlet__foot--fit">
            <div class="m-form__actions">
                <input type="submit" class="btn btn-primary" value="{{ __('Search') }}" />
                <a href="{{ route('user.index') }}" class="btn btn-default">{{ __('Reset') }}</a>
            </div>
        </div>
    </form>
</div>
