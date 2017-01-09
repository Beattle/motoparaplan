<?php
class ControllerModuleAllCategories extends Controller {
	protected $category_id = 0;
	protected $parent_id = 0;
	protected $path = array();
	protected $categories = array();
	//---------------------------------------------------------------------------------------------------------------------------
	protected function index() {
		$this->language->load('module/all_categories');
	   	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->load->model('catalog/category');
		
		if (isset($this->request->get['path'])) {
			$this->path = explode('_', $this->request->get['path']);
			
			$this->category_id = end($this->path);
		}

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.status = '1' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY c.parent_id, c.sort_order, cd.name");
		$this->categories = $query->rows;

		$this->data['category_menu'] = $this->loadCategories(0, $this->category_id);
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/all_categories.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/all_categories.tpl';
		} else {
			$this->template = 'default/template/module/all_categories.tpl';
		}
		
		$this->render();
	}
	//---------------------------------------------------------------------------------------------------------------------------
	protected function loadCategories($parent_id, $category_id, $path='') {
		$ret_string = '';
		
		foreach ($this->categories as $result) {
			if ($path)
				$new_path = $path.'_'.$result['category_id'];
			else
				$new_path = $result['category_id'];
				
			if ($result['parent_id'] == $parent_id) {
				$ret_string .= '<li>';
				
				$ret_string .= '<a class="'.($category_id == $result['category_id'] ? 'active' : '').'" href="' . $this->url->link('product/category','path=' .  $new_path)  . '">' . $result['name'] . '</a>';
				
	        	$ret_string .= $this->loadCategories($result['category_id'], $category_id, $new_path);
	        	
	        	$ret_string.= '</li>';
			}
		}

 		
		if ($ret_string) {
			if ($parent_id == 0) {
				$ret_string = '<ul class="all_categories">'.$ret_string.'</ul>'; 
			} else {
				$ret_string = '<ul>'.$ret_string.'</ul>'; 
			}
		}
		return $ret_string;
	}
}
?>
