<?php
class ModelIasdVote extends Model {

	public function getCandidates() {
		$query = $this->db->query("SELECT * FROM department d LEFT JOIN department_candidates dc ON (d.department_id = dc.department_id) WHERE status = 1 ORDER BY candidate_name");

		return $query->rows;
	}

	public function sendVote($data){
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "vote_user WHERE department_id = '" . $this->db->escape($data['department_id']) . "' AND user_id = '". $this->customer->getId() ."'");

		if (!$query->row){
			$this->db->query("INSERT INTO " . DB_PREFIX . " vote SET department_id = '" . $this->db->escape($data['department_id']) . "', candidate_id = '" . (int)$data['candidate_id'] . "'");
			$this->db->query("INSERT INTO " . DB_PREFIX . " vote_user SET department_id = '" . $this->db->escape($data['department_id']) . "', user_id = '". $this->customer->getId() ."'");
			return "Obrigado pelo voto!";
		} else {
			return "Você já votou nesse depto!";
		}

	}

	public function getDept(){
		$query = $this->db->query("SELECT * FROM department d WHERE status = 1");

		return $query->row;
	}

	public function getTotalVotes() {

		$dept = $this->getDept();

		$department_id = $dept['department_id'];

		$query = $this->db->query("SELECT count(*) total FROM vote v LEFT JOIN department d ON (d.department_id = v.department_id) WHERE d.department_id = " . $department_id);

		return $query->row['total'];
	}

	public function getResult() {

		$dept = $this->getDept();

		$department_id = $dept['department_id'];

		$query = $this->db->query("SELECT count(*) as votes, candidate_name FROM vote v, department_candidates dc WHERE v.candidate_id = dc.candidate_id and v.department_id = " . $department_id . " group by v.candidate_id ORDER BY votes DESC, candidate_name");

		return $query->rows;
	}

	public function getVoters() {

		$dept = $this->getDept();

		$department_id = $dept['department_id'];

		$query = $this->db->query("SELECT CONCAT(firstname, ' ', lastname) as name FROM vote_user left join customer on (user_id = customer_id) where department_id = '" . $department_id . "' ORDER BY vote_id ");

		return $query->rows;
	}
}
