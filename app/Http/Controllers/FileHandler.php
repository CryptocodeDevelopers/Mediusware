<?php 

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;

class FileHandler {
    public function getFile($array){
        extract($array);
        if(isset($oldFile)){
            $this->deleteFile($path, $oldFile);
        }
        if(!isset($type)){
            $type = Str::random(8);
        }
        $getExtType = explode("/", $data['type']);
        $ext = $getExtType[1];
                
        $filname = Str::slug($title).'-'.$type.'-'.rand(12345678,987654321).'.'.$ext;
        $image->resize($width, $height, function($e){
            $e->aspectRatio();
        })->save($this->pb_path($path.'/'.$filname));
        return $filname;
    }
    
    public function deleteFile($array){
        extract($array);    
        if(File::exists($this->pb_path($path.'/'.$file))){
            File::delete($this->pb_path($path.'/'.$file));
        }
    }

    public function pb_path($url){
        return public_path('dist/'.$url);
    }

}