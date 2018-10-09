<?php
class ControllerIasdResult extends Controller {
	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('iasd/result', '', true);

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
		$this->load->model('account/customer');

		$data['total_customers'] = $this->model_account_customer->getTotalCustomers();

		$data['department'] = $this->model_iasd_vote->getDept();

		$data['total'] = $this->model_iasd_vote->getTotalVotes();

		$data['results'] = $this->model_iasd_vote->getResult();
		
		$data['voters'] = $this->model_iasd_vote->getVoters();

		$data['header'] = $this->load->controller('common/header');

		$this->response->setOutput($this->load->view('iasd/result', $data));
	}
}