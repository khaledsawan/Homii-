<div class="main-menu menu-fixed menu-light menu-accordion    menu-shadow " data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

            <li class="nav-item active"><a href=""><i class="la la-mouse-pointer"></i><span class="menu-title"
                        data-i18n="nav.add_on_drag_drop.main">الرئيسية </span></a>
            </li>


            @can('studentsMangement')
                <li class="nav-item"><a href=""><i class="la la-home"></i>
                        <span class="menu-title" data-i18n="nav.dash.main"> طلبات التسجيل الطلاب </span>
                        <span class="badge badge badge-info badge-pill float-right mr-2">
                            {{ App\Models\Register::where('status', 0)->count() }} </span>

                    </a>
                    <ul class="menu-content">
                        <li class="active"><a class="menu-item" href="{{ route('registers') }}"
                                data-i18n="nav.dash.ecommerce"> عرض الكل </a>
                        </li>

                    </ul>
                </li>

                <li class="nav-item"><a href=""><i class="la la-male"></i>
                        <span class="menu-title" data-i18n="nav.dash.main">الطلاب </span>
                        <span
                            class="badge badge badge-warning  badge-pill float-right mr-2">{{ App\Models\Student::count() }}</span>
                    </a>
                    <ul class="menu-content">
                        <li class="active"><a class="menu-item" href="{{ route('students') }}"
                                data-i18n="nav.dash.ecommerce"> عرض الكل </a>
                        </li>
                        <li><a class="menu-item" href="{{ route('student.create') }}" data-i18n="nav.dash.crypto">أضافة
                                طالب </a>
                        </li>
                    </ul>
                </li>
            @endcan

            {{-- @if (auth()->user()->can('officesMangement')) --}}
            @can('officesMangement')
                <li class="nav-item"><a href=""><i class="la la-group"></i>
                        <span class="menu-title" data-i18n="nav.dash.main"> تسحيل المكاتب العقارية</span>
                        <span
                            class="badge badge badge-danger badge-pill float-right mr-2">{{ App\Models\OfficeRegister::count() }}</span>
                    </a>
                    <ul class="menu-content">
                        <li class="active"><a class="menu-item" href="{{ route('office.registers') }}"
                                data-i18n="nav.dash.ecommerce"> عرض الكل </a>
                        </li>

                    </ul>
                </li>

                <li class="nav-item"><a href=""><i class="la la-male"></i>
                        <span class="menu-title" data-i18n="nav.dash.main">المكاتب العقارية </span>
                        <span
                            class="badge badge badge-success badge-pill float-right mr-2">{{ App\Models\Office::count() }}</span>
                    </a>
                    <ul class="menu-content">
                        <li class="active"><a class="menu-item" href="{{ route('offices') }}"
                                data-i18n="nav.dash.ecommerce"> عرض الكل </a>
                        </li>
                        <li><a class="menu-item" href="{{ route('office.create') }}" data-i18n="nav.dash.crypto">أضافة
                                مكتب </a>
                        </li>
                    </ul>
                </li>

                {{-- @endif --}}
            @endcan


            <li class="nav-item">
                <a href=""><i class="la la-male"></i>
                    <span class="menu-title" data-i18n="nav.dash.main"> تسجيل المتبرعين </span>
                    <span
                        class="badge badge badge-secondary   badge-pill float-right mr-2">{{ App\Models\Donor::where('status', 0)->count() }}</span>
                </a>
                <ul class="menu-content">
                    <li class="active"><a class="menu-item" href="{{ route('donor.registers') }}"
                            data-i18n="nav.dash.ecommerce">عرض الكل
                        </a>
                    </li>
                </ul>
            </li>

            <li class="nav-item">
                <a href=""><i class="la la-male"></i>
                    <span class="menu-title" data-i18n="nav.dash.main"> المتبرعين </span>
                    <span
                        class="badge badge badge-danger  badge-pill float-right mr-2">{{ App\Models\Donor::count() }}</span>
                </a>
                <ul class="menu-content">
                    <li class="active"><a class="menu-item" href="{{ route('donors') }}"
                            data-i18n="nav.dash.ecommerce">عرض الكل
                        </a>
                    </li>

                    <li> <a class="menu-item" href="{{ route('donor.requestDonations') }}"
                        data-i18n="nav.dash.ecommerce">طلبات التبرع
                    </a>
                </li>

                <li> <a class="menu-item" href="{{ route('donor.totalDonations') }}"
                    data-i18n="nav.dash.ecommerce"> مبلغ التبرع الكلي
                </a>
                </li>

                
                    <li>
                        <a class="menu-item" href="{{ route('donor.create') }}" data-i18n="nav.dash.crypto">أضافة
                            متبرع جديد</a>
                    </li>


                </ul>
            </li>

            @can('HousesMangement')
                <li class="nav-item"><a href=""><i class="la la-television"></i>
                        <span class="menu-title" data-i18n="nav.dash.main">المنازل </span>
                        <span
                            class="badge badge badge-success badge-pill float-right mr-2">{{ App\Models\House::count() }}</span>
                    </a>
                    <ul class="menu-content">
                        <li class="active"><a class="menu-item" href="{{ route('houses') }}"
                                data-i18n="nav.dash.ecommerce"> عرض الكل </a>
                        </li>

                        <li><a class="menu-item" href="{{ route('order.index') }}" data-i18n="nav.dash.crypto">طلبات
                                تأجير المنازل
                            </a>
                        </li>

                        <li><a class="menu-item" href="{{ route('house.create') }}" data-i18n="nav.dash.crypto">أضافة
                                منزل </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item"><a href=""><i class="la la-television"></i>
                        <span class="menu-title" data-i18n="nav.dash.main">طلبات تأجير المنازل </span>
                        <span
                            class="badge badge badge-success badge-pill float-right mr-2">
                            {{ App\Models\House::where('number_students',4)->orWhere('number_students',3)->count() }}
                        </span>
                    </a>
                    <ul class="menu-content">
                        <li class="active"><a class="menu-item" href="{{ route('order.index') }}"
                                data-i18n="nav.dash.ecommerce"> عرض الكل </a>
                        </li>

                        {{-- <li><a class="menu-item" href="{{ route('house.create') }}" data-i18n="nav.dash.crypto">أضافة
                            منزل </a>
                    </li> --}}
                    </ul>
                </li>
            @endcan

            <li class=" navigation-header">
                <span data-i18n="nav.category.support">Support</span><i class="la la-ellipsis-h ft-minus"
                    data-toggle="tooltip" data-placement="right" data-original-title="Support"></i>
            </li>
            <li class=" nav-item"><a href="http://support.pixinvent.com/"><i class="la la-support"></i><span
                        class="menu-title" data-i18n="nav.support_raise_support.main">Raise Support</span></a>
            </li>
            <li class=" nav-item">
                <a href="https://pixinvent.com/modern-admin-clean-bootstrap-4-dashboard-html-template/documentation"><i
                        class="la la-text-height"></i>
                    <span class="menu-title" data-i18n="nav.support_documentation.main">Documentation</span>
                </a>
            </li>
        </ul>
    </div>
</div>
