@extends('layouts.admin')

@section('content')
    <div class="app-content content">
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12 mb-2">
                    <h3 class="content-header-title">  نعديل بيانات المنزل </h3>
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">     الرئيسية</a>
                                </li>
                                <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}"> -    جميع المنازل   </a>
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
                                    <h4 class="card-title"> بيانات المنزل  </h4>
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
                         

                                <table class="table table-striped">
                                  <thead>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <th scope="row"> العنوان</th>
                                      <td>{{$house -> address}}</td>
                                     
                                    </tr>

                                    <tr>
                                      <th scope="row">المكتب العقاري  </th>
                                      <td>{{$house -> office -> name}}</td>
                                     
                                    </tr>


                                    <tr>
                                      <th scope="row">عدد الغرف </th>
                                      <td>{{$house-> number_room}}</td>
                                    </tr>
                                  
                                    <tr>
                                      <th scope="row">عدد الطلاب</th>
                                      <td>{{$house-> number_students}}</td>
                                    </tr>
                                    <tr>
                                      <th scope="row">التفاصيل</th>
                                      <td>{{$house-> description}}</td>
                                    </tr>
                                    

                                    <tr>
                                      <th scope="row"> السعر  </th>
                                      <td>{{$house-> price}}</td>
                                     
                                    </tr>
                                   
                                  

                                    <tr>
                                      <th scope="row"> الاجراءات</th>
                                      <td>
                                            <div class="btn-group" role="group"
                                            aria-label="Basic example">

                                             <a href="{{ route('house.create' ) }}"
                                               class="btn btn-outline-info btn-min-width box-shadow-3 mr-1 mb-1">اضافة طالب جديد</a>


                                               <a href="{{ route('house.edit', $house->id) }}"
                                                class="btn btn-outline-success btn-min-width box-shadow-3 mr-1 mb-1">تعديل</a>

                                                <a href="{{ route('house.delete', $house->id) }}"
                                                  class="btn btn-outline-danger btn-min-width box-shadow-3 mr-1 mb-1">حذف</a>
                                                 
                                               </td>

                                            


                                  </div>
                                    </tr>
                                  </tbody>
                                </table>
                                        <div class="justify-content-center d-flex">

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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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






