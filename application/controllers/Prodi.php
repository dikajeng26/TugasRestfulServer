<?php
defined('BASEPATH') or exit('No direct script access allowed');
// Don't forget include/define REST_Controller path

/**
 *
 * Controller Prodi
 *
 * This controller for ...
 *
 * @package   CodeIgniter
 * @category  Controller REST
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @author    Raul Guerrero <r.g.c@me.com>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */
use chriskacerguis\RestServer\RestController;

class Prodi extends RestController
{
    
  public function __construct()
  {
    parent::__construct();
    $this->load->model('prodi_model','prd');
    // $this->methods['index_get']['limit'] = 2;
  }

  public function index_get()
  {
    $id = $this->get('id',true);
    if ($id === null){
      $p = $this->get('page');
      $p = (empty($p) ? 1 : $p);
      $total_data = $this->prd->count();
      $total_page = ceil($total_data/3);
      $start = ($p - 1)*3;
      $list = $this->prd->get(null, 3, $start);
      if ($list){
        $data = [
          'status' => true,
          'page' => $p,
          'total_data' => $total_data,
          'total_page' => $total_page,
          'data' => $list 
        ];
      }else{
        $data =[
          'status' => false,
          'msg' => 'data tidak ditemukan'
        ];
      }
      $this->response($data,RestController::HTTP_OK);
    }else{
      $data = $this->prd->get($id);
      if ($data){
        $this->response(['status'=>true,'data'=> $data],RestController::HTTP_OK);
      }else{
        $this->response(['status'=>false,'msg'=> $id.' data tidak ditemukan'],RestController::HTTP_NOTFOUND);
      } 
    }
  }

  public function index_post(){
    $data=[
      'id'=>$this->post('id',true),
      'jenjang'=>$this->post('jenjang',true),
      'prodi'=>$this->post('prodi',true)
    ];
    $simpan = $this->prd->add($data);
    if ($simpan['status']){
      $this->response(['status'=>true,'msg'=>$simpan['data'].' Data telah ditambahkan'],RestController::HTTP_CREATED);
    }else{
      $this->response(['status'=>false,'msg'=>$simpan['msg']],RestController::HTTP_INTERNAL_ERROR);
    }
  }

  public function index_put(){
    $data=[
      'id'=>$this->put('id',true),
      'jenjang'=>$this->put('jenjang',true),
      'prodi'=>$this->put('prodi',true)
    ];
    $id = $this->put('id',true);
    if ($id === null){
      $this->response(['status'=>false,'msg'=>'Masukkan ID yang akan dirubah'],RestController::HTTP_INTERNAL_ERROR);
    }
    $simpan = $this->prd->update($id, $data);
    if ($simpan['status']){
      $status = (int)$simpan['data'];
      if ($status>0){
        $this->response(['status'=>true,'msg'=>$simpan['data'].' Data telah diubah'],RestController::HTTP_BAD_REQUEST);
      }else{
        $this->response(['status'=>true,'msg'=>' Data tidak ada perubahan'],RestController::HTTP_OK);
      }
      
    }else{
      $this->response(['status'=>false,'msg'=>$simpan['msg']],RestController::HTTP_INTERNAL_ERROR);
    }
  }

  public function index_delete(){
    $id = $this->delete('id',true);
    if ($id === null){
      $this->response(['status'=>false,'msg'=>'Masukkan ID yang akan dirubah'],RestController::HTTP_INTERNAL_ERROR);
    }
    $delete = $this->prd->delete($id);
    if ($delete['status']){
      $status = (int)$delete['data'];
      if ($status>0){
        $this->response(['status'=>true,'msg'=>$id.' Data telah dihapus'],RestController::HTTP_BAD_REQUEST);
      }else{
        $this->response(['status'=>true,'msg'=>' Data tidak ada yang dihapus'],RestController::HTTP_OK);
      }
      
    }else{
      $this->response(['status'=>false,'msg'=>$delete['msg']],RestController::HTTP_INTERNAL_ERROR);
    }
  }
}


/* End of file Prodi.php */
/* Location: ./application/controllers/Prodi.php */