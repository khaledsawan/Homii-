
                                                        @extends('layouts.admin')

                                                        @section('content')
                                                            <div class="app-content content">
                                                                <div class="content-wrapper">
                                                                    <div class="content-header row">
                                                                        <div class="content-header-left col-md-6 col-12 mb-2">
                                                                            <h3 class="content-header-title">   جميع التبرعات  </h3>
                                                                            <div class="row breadcrumbs-top">
                                                                                 <div class="breadcrumb-wrapper col-12">
                                                                                    <ol class="breadcrumb">
                                                                                         <li class="breadcrumb-item"><a href="{{route('admin.dashboard')}}">الرئيسية</a>
                                                                                        </li>

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
                                                                                            <h4 class="card-title">   جميع المتبرعين</h4>
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
                                                                                                        {{-- <th> #</th> --}}
                                                                                                        <th> المبلغ المالي</th>
                                                                                                        <th>التاريخ</th>
                                                                                                        
                                                                                                       
                                                                                                    </tr>
                                                                                                    </thead>
                                                                                                    <tbody>
                                                                                                     
                                                                                                    @isset($total)
                                                                                                       
                                                                                                            <tr>
                                                                                                                {{-- <td>{{1 }}</td> --}}
                                                                                                                <td>{{$total -> total_donations }} ليرة سورية</td>
                                                                                                                <td>{{$total -> updated_at -> format('d/m/Y')}}</td>
                                                                                                            

                                                                                                             
                                                                                                            </tr>
                                                                                                        
                                                                                                    @endisset

                                                                                                   
                                                                                                    </tbody>

                                                                                                  

                                                                                                </table>
                                                                                                <div style="text-align: center">
                                                                                                <button type="button" class="btn btn-warning mr-1 " onclick="history.back();">
                                                                                                    <i class="ft-x"></i> رجوع
                                                                                                </button>       
                                                                                                </div>
                                                                                                </div>
                                                                                            </div>
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
