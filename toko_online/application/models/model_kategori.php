<?php

class Model_kategori extends CI_Model{
    public function data_abon(){
        return $this->db->get_where("tb_barang",array('kategori' => 'abon'));
    }

    public function data_sambal(){
        return $this->db->get_where("tb_barang",array('kategori' => 'sambal'));
    }

    public function data_keripik(){
        return $this->db->get_where("tb_barang",array('kategori' => 'keripik'));
    }

    public function data_camilan_manis(){
        return $this->db->get_where("tb_barang",array('kategori' => 'camilan manis'));
    }
}