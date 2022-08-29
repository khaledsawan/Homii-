@extends('layouts.admin')

@section('content')

    <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">الرئيسية </a>
                                </li>
                                
                                
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
            <div class="content-body">
                <!-- Basic form layout section start -->
                <section id="basic-form-layouts">
                    <div class="row match-height">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="col-md-3 offset-md-5"  id="basic-layout-form"><strong>تغير كلمة السر </strong></h4>
                                    <a class="heading-elements-toggle"><i class="la la-ellipsis-v font-medium-3"></i></a>
                                    <div class="heading-elements">
                                        <ul class="list-inline mb-0">
                                            <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                            <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                            <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                            <li><a data-action="close"><i class="ft-x"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                @include('admin.includes.alerts.success')
                                @include('admin.includes.alerts.errors')
                                {{-- <div class="card-content collapse show"> --}}
                                   
                                    <form method="POST" action="{{ route('admin.updatePassword') }}">
                                        @csrf
                
                                        <div class="form-group row">
                                            <label for="oldPassword" class="col-md-3 col-form-label text-md-right">كلمة السر الحالية</label>
                
                                            <div class="col-md-6">
                                                <input id="oldPassword" type="text" class="form-control"
                                                 
                                                 
                                                 name="oldPassword" required autocomplete="newPassword"> 
                
                                                 {{-- @error('oldPassword')
                                                 <span class="text-danger">{{ $message }}</span>
                                                @enderror --}}
                                            </div>
                                        </div>
                
                                        <div class="form-group row">
                                            <label for="newPassword" class="col-md-3 col-form-label text-md-right">كلمة السر القديمة </label>
                
                                            <div class="col-md-6">
                                                <input id="newPassword" type="text" class="form-control"  
                                                name="newPassword" required autocomplete="newPassword">
                
                                                {{-- @error('newPassword')
                                                            <span class="text-danger">{{ $message }}</span>
                                                @enderror --}}
                                            </div>
                                        </div>
                
                                        <div class="form-group row">
                                            <label for="confirmation_password" class="col-md-3 col-form-label text-md-right"> ناكيد كلمة السر</label>
                
                                            <div class="col-md-6">
                                                <input id="confirmation_password" type="text" class="form-control" 
                                                name="confirmation_password" required autocomplete="newPassword">
                                            
                                                {{-- @error('confirmation_password')
                                                <span class="text-danger">{{ $message }}</span>
                                                @enderror --}}
                                            </div>
                                        </div>
                
                                        <div class="form-group row mb-0">
                                            <div class="col-md-6 offset-md-5">
                                                <button type="submit" class="btn btn-primary">
                                                    تحديث  
                                                </button>
                                              
                                            </div>
                                        </div>
                                    </form>     

                              
                                </form>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
        </section>
        <!-- // Basic form layout section end -->
    </div>
    </div>
    </div>
@stop

