package org.minioa.core;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.faces.context.FacesContext;
import org.hibernate.Query;
import org.hibernate.Session;
import org.jboss.seam.ui.*;

public class Role {

	public Lang lang;

	public Lang getLang() {
		if (lang == null)
			lang = (Lang) FacesContext.getCurrentInstance().getExternalContext().getApplicationMap().get("Lang");
		return lang;
	}

	public MySession mySession;

	public MySession getMySession() {
		if (mySession == null)
			mySession = (MySession) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("MySession");
		return mySession;
	}

	private Session session;

	private Session getSession() {
		if (session == null)
			session = new HibernateEntityLoader().getSession();
		if (!session.isOpen())
			session = session.getSessionFactory().openSession();
		return session;
	}

	private String init;

	public String getInit() {
		selectRecordById();
		return init;
	}

	private Map<String, String> prop;

	public void setProp(Map<String, String> data) {
		prop = data;
	}

	public Map<String, String> getProp() {
		if (prop == null)
			prop = new HashMap<String, String>();
		return prop;
	}

	private List<Role> recordsList;

	public List<Role> getRecordsList() {
		if (recordsList == null)
			buildRecordsList();
		return recordsList;
	}

	public Role() {
	}

	public Role(int i) {
	}

	public Role(Map<String, String> data) {
		setProp(data);
	}

	public List<Integer> dsList;

	public List<Integer> getDsList() {
		if (dsList == null) {
			getMySession();
			dsList = new ArrayList<Integer>();

			String key = "";
			if (mySession.getTempStr() != null) {
				if (mySession.getTempStr().get("Role.key") != null)
					key = mySession.getTempStr().get("Role.key").toString();
			}

			String sql = getSession().getNamedQuery("core.role.records.count").getQueryString();
			String where = " where 1=1";
			if (!key.equals(""))
				where += " and ta.roleName like :key";
			Query query = getSession().createSQLQuery(sql + where);
			if (!key.equals(""))
				query.setParameter("key", "%" + key + "%");
			
			int i = 0;
			int dc = Integer.valueOf(String.valueOf(query.list().get(0)));
			while (i < dc) {
				dsList.add(i);
				i++;
			}
			mySession.setRowCount(dsList.size());
		}
		return dsList;
	}

	public void buildRecordsList() {
		try {

			getDsList();
			recordsList = new ArrayList<Role>();
			Map params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
			if ("false".equals((String) params.get("reload"))) {
				int size = 0;
				while (size < mySession.getPageSize()) {
					recordsList.add(new Role(size));
					size++;
				}
				return;
			}
			if ("true".equals((String) params.get("resetPageNo")))
				mySession.setScrollerPage(1);

			String key = "";
			if (mySession.getTempStr() != null) {
				if (mySession.getTempStr().get("Role.key") != null)
					key = mySession.getTempStr().get("Role.key").toString();
			}

			String sql = getSession().getNamedQuery("core.role.records").getQueryString();
			String where = " where 1=1";
			String other = " order by ta.roleName desc limit :limit offset :offset";

			if (!key.equals(""))
				where += " and ta.roleName like :key";
			Query query = getSession().createSQLQuery(sql + where + other);
			query.setParameter("limit", mySession.getPageSize());
			query.setParameter("offset", (Integer.valueOf(mySession.getScrollerPage()) - 1) * mySession.getPageSize());

			if (!key.equals(""))
				query.setParameter("key", "%" + key + "%");

			Iterator it = query.list().iterator();
			Map<String, String> p;
			while (it.hasNext()) {
				Object obj[] = (Object[]) it.next();
				p = new HashMap<String, String>();
				p.put("id", FunctionLib.getString(obj[0]));
				p.put("roleName", FunctionLib.getString(obj[6]));
				p.put("roleDesc", FunctionLib.getString(obj[7]));
				recordsList.add(new Role(p));
			}
			it = null;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * ��ȡһ����¼
	 */
	public void selectRecordById() {
		try {
			Map params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
			String id = (String) params.get("id");
			if (id == null || !FunctionLib.isNum(id))
				return;
			Query query = getSession().getNamedQuery("core.role.getrecordbyid");
			query.setParameter("id", id);
			Iterator it = query.list().iterator();
			while (it.hasNext()) {
				Object obj[] = (Object[]) it.next();
				prop = new HashMap<String, String>();
				prop.put("roleName", FunctionLib.getString(obj[6]));
				prop.put("roleDesc", FunctionLib.getString(obj[7]));
			}
			it = null;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public void newRecord() {
		try {
			getMySession();
			if ("".equals(prop.get("roleName"))) {
				String msg = getLang().getProp().get(getMySession().getL()).get("noempty");
				getMySession().setMsg(msg, Integer.valueOf(0));
				return;
			}
			if (isRoleExists(prop.get("roleName"))) {
				String msg = getLang().getProp().get(getMySession().getL()).get("rolenamehasbeanexists");
				getMySession().setMsg(msg, Integer.valueOf(0));
				return;
			}

			Query query = getSession().getNamedQuery("core.role.newrecord");
			query.setParameter("cId", 0);
			query.setParameter("roleName", prop.get("roleName"));
			query.setParameter("roleDesc", prop.get("roleDesc"));
			query.executeUpdate();

			String msg = getLang().getProp().get(getMySession().getL()).get("success");
			getMySession().setMsg(msg, Integer.valueOf(1));
		} catch (Exception ex) {
			String msg = getLang().getProp().get(getMySession().getL()).get("faield");
			getMySession().setMsg(msg, Integer.valueOf(2));
			ex.printStackTrace();
		}
	}

	public boolean isRoleExists(String roleName) {
		try {
			if (Integer.valueOf(FunctionLib.exeSql(getSession(), "core.role.isrecordexistbyname", "roleName", roleName, "float")) == 0)
				return false;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return true;
	}

	public boolean isRoleExists(String roleName, String id) {
		try {
			if (Integer.valueOf(FunctionLib.exeSql(getSession(), "core.role.isrecordexistbyname.byid", "roleName", roleName, "id", id, "float")) == 0)
				return false;
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return true;
	}

	public void updateRecordById() {
		try {
			getMySession();
			Map params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
			String id = (String) params.get("id");
			if (!FunctionLib.isNum(id))
				return;

			if ("".equals(prop.get("roleName"))) {
				String msg = getLang().getProp().get(getMySession().getL()).get("noempty");
				getMySession().setMsg(msg, Integer.valueOf(0));
				return;
			}
			if (isRoleExists(prop.get("roleName"), id)) {
				String msg = getLang().getProp().get(getMySession().getL()).get("rolenamehasbeanexists");
				getMySession().setMsg(msg, Integer.valueOf(0));
				return;
			}
			Query query = getSession().getNamedQuery("core.role.updaterecordbyid");
			query.setParameter("mId", 0);
			query.setParameter("roleName", prop.get("roleName"));
			query.setParameter("roleDesc", prop.get("roleDesc"));
			query.setParameter("id", id);
			query.executeUpdate();
			query = null;

			String msg = getLang().getProp().get(getMySession().getL()).get("success");
			getMySession().setMsg(msg, Integer.valueOf(1));
		} catch (Exception ex) {
			String msg = getLang().getProp().get(getMySession().getL()).get("faield");
			getMySession().setMsg(msg, Integer.valueOf(2));
			ex.printStackTrace();
		}
	}

	/**
	 * ɾ��һ����¼
	 */
	public void deleteRecordById() {
		try {
			String id = getMySession().getTempStr().get("Role.id");
			Query query = getSession().getNamedQuery("core.role.deleterecordbyid");
			query.setParameter("id", id);
			query.executeUpdate();
			query = null;
			String msg = getLang().getProp().get(getMySession().getL()).get("success");
			getMySession().setMsg(msg, Integer.valueOf(1));
		} catch (Exception ex) {
			String msg = getLang().getProp().get(getMySession().getL()).get("faield");
			getMySession().setMsg(msg, Integer.valueOf(2));
			ex.printStackTrace();
		}
	}

	public void showDialog() {
		try {
			Map params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
			getMySession().getTempStr().put("Role.id", (String) params.get("id"));
		} catch (Exception ex) {
			String msg = getLang().getProp().get(getMySession().getL()).get("faield");
			getMySession().setMsg(msg, Integer.valueOf(2));
			ex.printStackTrace();
		}
	}
	
}