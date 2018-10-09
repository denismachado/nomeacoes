<?php
class ControllerIasdVote extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('iasd/vote', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		} 

		$this->document->setTitle("Nomeações 2017");

		$this->load->model('iasd/vote');

		if ($this->request->server['REQUEST_METHOD'] == 'POST') {

			$this->session->data['success'] = $this->model_iasd_vote->sendVote($this->request->post);

			$this->response->redirect($this->url->link('iasd/vote', '', true));
		}

		$data['action'] = $this->url->link('iasd/vote', '', true);

		$data['candidates'] = $this->model_iasd_vote->getCandidates();

		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('iasd/vote', $data));
	}
}