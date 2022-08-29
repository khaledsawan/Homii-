@extends('layouts.admin')

@section('content')

    <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">الرئيسية </a>
                                </li>
                                <li class="breadcrumb-item"><a href="{{ route('students') }}"> جميع المنازل  </a>
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
                                    <h4 class="card-title" id="basic-layout-form"><strong> تعديل المكتب العقاري </strong></h4>
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
                                <div class="card-body">
                                    <form class="form" action="{{ Route('house.update', $house->id) }}"
                                        method="POST" enctype="multipart/form-data">
                                        @csrf

                                        <input type="hidden" name="id" value="{{ $house-> id}}" > 

                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-home"></i>تعديل بيانات المنزل
                                            </h4>



                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> العنوان</label>
                                                        <input type="text" value="{{ $house->address }}" id=""
                                                            class="form-control" placeholder=" " name="address">
                                                        @error('address')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput2"> عدد الغرف </label>
                                                        <input name="number_room" value="{{ $house-> number_room }}"
                                                            class="form-control">

                                                        @error('number_room')
                                                            <span class="text-danger"> {{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> عدد الطلاب</label>
                                                        <input type="text" value="{{ $house -> number_students }}" id="mobile"
                                                            class="form-control" placeholder=" " name="number_students">
                                                        @error('number_students')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> المكتب العقاري </label>
                                                        <input class="form-control" list="offices" name="office_id"
                                                            id="office_id">
                                                          
                                                        <datalist id="offices">
                                                            @isset($offices)
                                                            @foreach ($offices as $office)
                                                                <option value="{{$office->id}}">{{$office->name}}</option>
                                                            @endforeach
                                                            @endisset
                                                        </datalist>
                                                        @error('office_id')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                                


                                        </div>

                                        <div class="row">

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="projectinput1"> الظروف</label>
                                                    <input type="text" value="{{ $house -> description }}" id="mobile"
                                                        class="form-control" placeholder=" " name="description">
                                                    @error('description')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>


                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="projectinput1"> السعر</label>
                                                    <input type="text" value="{{ $house -> price }}" id="mobile"
                                                        class="form-control" placeholder=" " name="price">
                                                    @error('price')
                                                        <span class="text-danger">{{ $message }}</span>
                                                    @enderror
                                                </div>
                                            </div>

                                        

                                    </div>


                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary">
                                                <i class="la la-check-square-o"></i> حفظ
                                            </button>
                                            <button type="button" class="btn btn-warning mr-1" onclick="history.back();">
                                                <i class="ft-x"></i> تراجع
                                            </button>
                                        </div>
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
