<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * Model JenisPembayaran_model
 *
 * This Model for ...
 * 
 * @package		CodeIgniter
 * @category	Model
 * @author    Setiawan Jodi <jodisetiawan@fisip-untirta.ac.id>
 * @link      https://github.com/setdjod/myci-extension/
 * @param     ...
 * @return    ...
 *
 */

class JenisPembayaran_model extends CI_Model {

  // ------------------------------------------------------------------------

  public function __construct()
  {
    parent::__construct();
  }

  public function get($id = null, $limit = 5, $offset = 0){
    if ($id === null){
      return $this->db->get('tb_jenispembayaran', $limit, $offset)->result();
    }else{
      return $this->db->get_where('tb_jenispembayaran',['id' => $id])->result_array();
    }
  }

  public function count(){
    return $this->db->get('tb_jenispembayaran')->num_rows();
  }

  public function add($data){
    try{
      $this->db->insert('tb_jenispembayaran',$data);
      $error = $this->db->error();
      if (!empty($error['code'])){
        throw new Exception('Terjadi Kesalahan: '.$error['message']);
        return false;
      }
      return ['status'=>true,'data'=>$this->db->affected_rows()];
    } catch (Exception $ex) {
      return ['status'=>false,'msg'=>$ex->getMessage()];
    }
  }

  public function update($id, $data){
    try{
      $this->db->update('tb_jenispembayaran',$data, ['id'=>$id]);
      $error = $this->db->error();
      if (!empty($error['code'])){
        throw new Exception('Terjadi Kesalahan: '.$error['message']);
        return false;
      }
      return ['status'=>true,'data'=>$this->db->affected_rows()];
    } catch (Exception $ex) {
      return ['status'=>false,'msg'=>$ex->getMessage()];
    }
  }

  public function delete($id){
    try{
      $this->db->delete('tb_jenispembayaran', ['id'=>$id]);
      $error = $this->db->error();
      if (!empty($error['code'])){
        throw new Exception('Terjadi Kesalahan: '.$error['message']);
        return false;
      }
      return ['status'=>true,'data'=>$this->db->affected_rows()];
    } catch (Exception $ex) {
      return ['status'=>false,'msg'=>$ex->getMessage()];
    }
  }
}

/* End of file JenisPembayaran_model.php */
/* Location: ./application/models/JenisPembayaran_model.php */