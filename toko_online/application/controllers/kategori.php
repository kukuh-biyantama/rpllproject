<?php

class Kategori extends CI_Controller{
    public function abon()
    {
        $data['abon'] = $this->model_kategori->data_abon()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('abon', $data);
        $this->load->view('templates/footer');
    }

    public function sambal()
    {
        $data['sambal'] = $this->model_kategori->data_sambal()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('sambal', $data);
        $this->load->view('templates/footer');
    }

    public function keripik()
    {
        $data['keripik'] = $this->model_kategori->data_keripik()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('keripik', $data);
        $this->load->view('templates/footer');
    }

    public function camilan_manis()
    {
        $data['camilan_manis'] = $this->model_kategori->data_camilan_manis()->result();
        $this->load->view('templates/header');
        $this->load->view('templates/sidebar');
        $this->load->view('camilan_manis', $data);
        $this->load->view('templates/footer');
    }
}