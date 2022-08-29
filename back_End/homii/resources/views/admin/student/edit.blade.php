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
                                <li class="breadcrumb-item"><a href="{{ route('students') }}"> جميع الطلاب </a>
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
                                    <h4 class="card-title" id="basic-layout-form"><strong> تعديل طالب </strong></h4>
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
                                    <form class="form" action="{{ Route('student.update', $student->id) }}"
                                        method="POST" enctype="multipart/form-data">
                                        @csrf

                                        <input type="hidden" name="id" value="{{ $student-> id}}" > 

                                        <div class="form-body">
                                            <h4 class="form-section"><i class="ft-home"></i>تعديل بيانات الطالب
                                            </h4>



                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> الاسم</label>
                                                        <input type="text" value="{{ $student->firstName }}" id=""
                                                            class="form-control" placeholder=" " name="firstName">
                                                        @error('firstName')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput2"> الكنية </label>
                                                        <input name="lastName" value="{{ $student->lastName }}"
                                                            class="form-control">

                                                        @error('lastName')
                                                            <span class="text-danger"> {{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>


                                            <div class="row">

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> الهاتف</label>
                                                        <input type="text" value="{{ $student->mobile }}" id="mobile"
                                                            class="form-control" placeholder=" " name="mobile">
                                                        @error('mobile')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> العمر </label>
                                                        <input type="text" value="{{ $student->age }}" id=""
                                                            class="form-control" placeholder=" " name="age">
                                                        @error('age')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                            </div>



                                            <div class="row">


                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput2"> المدينة </label>
                                                        <input name="city" value="{{ $student -> city }}"
                                                            class="form-control">

                                                        @error('city')
                                                            <span class="text-danger"> {{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>


                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> الكلية </label>
                                                        <input type="text"
                                                            value="{{ $student-> university_college }}" id=""
                                                            class="form-control" placeholder=" "
                                                            name="university_college">
                                                        @error('university_college')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                            </div>


                                            <div class="row">


                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput2"> السنة الدراسية </label>
                                                        <input name="academic_year"
                                                            value="{{ $student-> academic_year }}"
                                                            class="form-control">

                                                        @error('academic_year')
                                                            <span class="text-danger"> {{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1"> الظروف </label>
                                                        <input type="text" value="{{ $student -> description }}" id=""
                                                            class="form-control" placeholder=" " name="description">
                                                        @error('description')
                                                            <span class="text-danger">{{ $message }}</span>
                                                        @enderror
                                                    </div>
                                                </div>

                                            </div>





                                        </div>

                                        <div class="row">

                                            

                                              <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="projectinput1">  الجنس </label>
                                                        <br>
                                                        <select class="form-select" aria-label="Default select example" name="gender" style="width: 300px; hight:170px">
                                                           
                                                            <option value="male">ذكر</option>
                                                            <option value="female">انثى</option>
                                                          </select>
                                                    </div>
                                                </div>

                                                {{-- <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="gender" class="form-label">اخنر من فضلك:</label>
                                                        <input class="form-control"
                                                            value="{{ $student-> gender }}" list="option"
                                                            name="gender" id="gender">
                                                        <datalist id="option">
                                                            <option value="male">ذكر</option>
                                                            <option value="female">انثى</option>

                                                        </datalist>
                                                    </div>
                                                </div> --}}
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
