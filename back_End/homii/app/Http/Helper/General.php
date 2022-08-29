<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;

function uploadImage($folder ,$image){
    $image ->store('/',$folder);
    $fileName =$image ->hashName();
    $path = 'images/'.$folder .'/'.$fileName ;
    return $path ;
}

function deleteImage($image){
    $path_image = Str::after($image, 'images/');
          $path = 'images/'.$path_image ;   
            if(File::exists($path))
                  unlink($path);

}

function StudentChart(){
    $result =DB::select(DB::raw("SELECT count(*) as total_city ,city FROM students GROUP BY city"));
        $chartData ="";
        foreach($result as $list){
            $chartData .= "['".$list->city."'  , ".$list->total_city."],";
        }
        $arr['chartData'] =rtrim($chartData,",");
        return $arr ;
}