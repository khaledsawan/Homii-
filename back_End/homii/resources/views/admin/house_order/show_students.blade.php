
                                                        @extends('layouts.admin')

                                                        @section('content')
                                                        <div class="app-content content">
                                                            <div class="content-wrapper">
                                                                <div class="content-header row">
                                                                    <div class="content-header-left col-md-6 col-12 mb-2">
                                                                        <div class="row breadcrumbs-top">
                                                                            <div class="breadcrumb-wrapper col-12">
                                                                                <ol class="breadcrumb">
                                                                                    <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">الرئيسية</a>
                                                                                    </li>
                                                                                    <li class="breadcrumb-item"><a href="{{ route('students') }}"> - جميع الطلاب </a>
                                                                                    </li>
                                                                                    
                                                                                </ol>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                    <div class="content-body">
                                                                        <!-- DOM - jQuery events table -->
                                                                        <section id="dom">
                                                                            <div class="row">
                                                                                <div class="col-12">
                                                                                    <div class="card">
                                                                                        <div class="card-header">
                                                                                            <h4 class="card-title">   جميع الطلاب </h4>
                                                                                            <a class="heading-elements-toggle"><i
                                                                                                    class="la la-ellipsis-v font-medium-3"></i></a>

                                

                                                                                            <div class="heading-elements">
                                                                                                <ul class="list-inline mb-0">
                                                                                                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                                                                                    <li><a data-action="reload"><i class="ft-rotate-cw"></i></a></li>
                                                                                                    <li><a data-action="expand"><i class="ft-maximize"></i></a></li>
                                                                                                    <li><a data-action="close"><i class="ft-x"></i></a></li>
                                                                                                </ul>
                                                                                            </div>

                                                                                           

                                                                                        @include('admin.includes.alerts.success')
                                                                                        @include('admin.includes.alerts.errors')

                                                                                        <div class="card-content collapse show">
                                                                                            <div class="card-body card-dashboard">
                                                                                                <table
                                                                                                    class="table display nowrap table-striped table-bordered  ">  {{--scroll-horizontal--}}
                                                                                                    <thead>
                                                                                                    <tr>
                                                                                                        <th> الاسم</th>
                                                                                                        <th>البريد الالكنروني</th>
                                                                                                        <th>الهاتف</th>
                                                                                                        <th>الدفع شهريا</th>
                                                                                                        <th>الاجراءات</th>
                                                                                                       
                                                                                                    </tr>
                                                                                                    </thead>
                                                                                                    <tbody>

                                                                                                    @isset($students)
                                                                                                        @foreach($students as $student)
                                                                                                            <tr>
                                                                                                                <td>{{$student -> firstName .' '.$student-> lastName}}</td>
                                                                                                                <td>{{$student -> email }}</td>
                                                                                                                <td>{{$student -> mobile}}</td>
                                                                                                                <td>{{$student -> newPrice}}</td>
                                                                                                            

                                                                                                                <td>
                                                                                                                    <div class="btn-group" role="group"
                                                                                                                         aria-label="Basic example">
                                                                                                                        <a href="{{Route('student.show',$student->id)}}"
                                                                                                                           class="btn btn-outline-primary btn-min-width box-shadow-3 mr-1 mb-1">عرض</a>

                                                                                                                           <a href="{{Route('order.deleteStudent',$student->id)}}"
                                                                                                                            class="btn btn-outline-danger btn-min-width box-shadow-3 mr-1 mb-1">حذف</a>
                                                                                                                    </div>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        @endforeach
                                                                                                    @endisset


                                                                                                    </tbody>
                                                                                                </table>
                                                                                             
                                                                                                
                                                                                            </div>
                                                                                        </div>
                                                                                        <div>
                                                                                            <button  type="button" class="btn btn-warning mr-1" onclick="history.back();">
                                                                                                <i class="ft-x"></i> تراجع
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </section>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        @endsection

                                                    </td>
                                                </tr>
                                            


                                        </tbody>
                                    </table>
                                    <div class="justify-content-center d-flex">
                                        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
