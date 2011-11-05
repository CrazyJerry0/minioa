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

public class Log {
	/**
	 * ���ߣ�daiqianjie ��ַ��www.minioa.net �������ڣ�2011-11-05
	 * 
	 * 
	 * ���� core_log���ֶ�˵�� ��tag����ǩ�� refId����ر�ļ�¼id��������������־��¼��summary������ժҪ��details��
	 * ��ϸ�Ĳ���sql��ip��������ip
	 */

	/**
	 * ��ȡ��ΪLang��javabean
	 */
	public Lang lang;

	public Lang getLang() {
		if (lang == null)
			lang = (Lang) FacesContext.getCurrentInstance().getExternalContext().getApplicationMap().get("Lang");
		if (lang == null)
			FunctionLib.redirect(FunctionLib.getWebAppName());
		return lang;
	}

	/**
	 * ��ȡ��ΪMySession��javabean�����ڻ�ȡ��ǰ�û��ĻỰ����
	 */
	public MySession mySession;

	public MySession getMySession() {
		if (mySession == null)
			mySession = (MySession) FacesContext.getCurrentInstance().getExternalContext().getSessionMap().get("MySession");
		if (mySession == null)
			FunctionLib.redirect(FunctionLib.getWebAppName());
		return mySession;
	}

	/**
	 * ����һ���������ӻỰ
	 */
	private Session session;

	private Session getSession() {
		if (session == null)
			session = new HibernateEntityLoader().getSession();
		return session;
	}

	/**
	 * ��ʼ��һ����¼�����ڳ�ʼ���޸ļ�¼��ҳ��
	 */
	private String init;

	public String getInit() {
		selectRecordById();
		return init;
	}

	/**
	 * �����ֶ�Map���ַ�����
	 */
	private Map<String, String> prop;

	public void setProp(Map<String, String> data) {
		prop = data;
	}

	public Map<String, String> getProp() {
		if (prop == null)
			prop = new HashMap<String, String>();
		return prop;
	}

	/**
	 * �����¼�б����ڳ䵱���ݱ�rich:dataTable������Դ
	 */
	private List<Log> recordsList;

	public List<Log> getRecordsList() {
		if (recordsList == null)
			buildRecordsList();
		return recordsList;
	}

	/**
	 * ���幹�캯��
	 */
	public Log() {
	}

	public Log(int i) {
	}

	public Log(Map<String, String> data) {
		setProp(data);
	}

	/**
	 * ��ҳ�б������ڷ�ҳ
	 */
	public List<Integer> dsList;

	public List<Integer> getDsList() {
		if (dsList == null) {
			getMySession();
			dsList = new ArrayList<Integer>();

			String key = "";
			if (mySession.getTempStr() != null) {
				if (mySession.getTempStr().get("Log.key") != null)
					key = mySession.getTempStr().get("Log.key").toString();
			}

			String sql = getSession().getNamedQuery("core.log.records.count").getQueryString();
			String where = " where 1=1";
			if (!key.equals(""))
				where += " and tag like :key";
			if (!getMySession().getHasOp().get("101002"))
				where += " and CID_ = :cId";
			Query query = getSession().createSQLQuery(sql + where);
			if (!key.equals(""))
				query.setParameter("key", "%" + key + "%");
			if (!getMySession().getHasOp().get("101002"))
				query.setParameter("cId", getMySession().getUserId());

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

	/**
	 * �����¼�б�
	 */
	public void buildRecordsList() {
		try {

			getDsList();
			recordsList = new ArrayList<Log>();
			Map<?, ?> params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
			if ("false".equals((String) params.get("reload"))) {
				int size = 0;
				while (size < mySession.getPageSize()) {
					recordsList.add(new Log(size));
					size++;
				}
				return;
			}
			if ("true".equals((String) params.get("resetPageNo")))
				mySession.setScrollerPage(1);

			String key = "";
			if (mySession.getTempStr() != null) {
				if (mySession.getTempStr().get("Log.key") != null)
					key = mySession.getTempStr().get("Log.key").toString();
			}

			String sql = getSession().getNamedQuery("core.log.records").getQueryString();
			String where = " where 1=1";
			String other = " order by ta.ID_ desc limit :limit offset :offset";

			if (!key.equals(""))
				where += " and ta.tag like :key";
			if (!getMySession().getHasOp().get("101002"))
				where += " and ta.CID_ = :cId";

			Query query = getSession().createSQLQuery(sql + where + other);
			query.setParameter("limit", mySession.getPageSize());
			query.setParameter("offset", (Integer.valueOf(mySession.getScrollerPage()) - 1) * mySession.getPageSize());

			if (!key.equals(""))
				query.setParameter("key", "%" + key + "%");
			if (!getMySession().getHasOp().get("101002"))
				query.setParameter("cId", getMySession().getUserId());

			Iterator<?> it = query.list().iterator();
			Map<String, String> p;
			while (it.hasNext()) {
				Object obj[] = (Object[]) it.next();
				p = new HashMap<String, String>();
				p.put("id", FunctionLib.getString(obj[0]));
				p.put("cId", FunctionLib.getString(obj[1]));
				p.put("cDate", FunctionLib.getString(obj[2]));
				p.put("tag", FunctionLib.getString(obj[3]));
				p.put("summary", FunctionLib.getString(obj[4]));
				p.put("ip", FunctionLib.getString(obj[5]));
				p.put("cUser", FunctionLib.getString(obj[6]));
				recordsList.add(new Log(p));
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
			Map<?, ?> params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
			String id = (String) params.get("id");
			if (FunctionLib.isNum(id)) {
				Query query = getSession().getNamedQuery("core.log.getrecordbyid");
				query.setParameter("id", id);
				Iterator<?> it = query.list().iterator();
				while (it.hasNext()) {
					Object obj[] = (Object[]) it.next();
					prop = new HashMap<String, String>();
					prop.put("id", FunctionLib.getString(obj[0]));
					prop.put("cId", FunctionLib.getString(obj[1]));
					prop.put("cDate", FunctionLib.getString(obj[2]));
					prop.put("tag", FunctionLib.getString(obj[3]));
					prop.put("refId", FunctionLib.getString(obj[4]));
					prop.put("summary", FunctionLib.getString(obj[5]));
					prop.put("details", FunctionLib.getString(obj[6]));
					prop.put("ip", FunctionLib.getString(obj[7]));
					prop.put("cUser", FunctionLib.getString(obj[8]));
				}
				it = null;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * ɾ��һ����¼
	 */
	public void deleteRecordById() {
		try {
			String id = getMySession().getTempStr().get("Log.id");
			Query query = getSession().getNamedQuery("core.log.deleterecordbyid");
			query.setParameter("id", id);
			query.executeUpdate();
			String msg = getLang().getProp().get(getMySession().getL()).get("success");
			getMySession().setMsg(msg, 1);

			msg = getMySession().getDisplayName() + "ɾ������һ����־��¼";
			FunctionLib.writelog(getSession(), getMySession().getUserId(), getMySession().getIp(), "log", Integer.valueOf(id), msg, query.getQueryString());

			query = null;
		} catch (Exception ex) {
			String msg = getLang().getProp().get(getMySession().getL()).get("faield");
			getMySession().setMsg(msg, 2);
			ex.printStackTrace();
		}
	}

	/**
	 * ����ɾ��efId���������־
	 */
	public void deleteRecords() {
		try {
			Query query = getSession().getNamedQuery("core.log.deleterecords");
			query.executeUpdate();
			query = null;
			String msg = getLang().getProp().get(getMySession().getL()).get("success");
			getMySession().setMsg(msg, 1);

			msg = getMySession().getDisplayName() + "�������־";
			FunctionLib.writelog(getSession(), getMySession().getUserId(), getMySession().getIp(), "log", 1, msg, "");
		} catch (Exception ex) {
			String msg = getLang().getProp().get(getMySession().getL()).get("faield");
			getMySession().setMsg(msg, 2);
			ex.printStackTrace();
		}
	}

	/**
	 * ɾ����¼ǰȷ�϶Ի���
	 */
	public void showDialog() {
		try {
			Map<?, ?> params = FacesContext.getCurrentInstance().getExternalContext().getRequestParameterMap();
			getMySession().getTempStr().put("Log.id", (String) params.get("id"));
		} catch (Exception ex) {
			String msg = getLang().getProp().get(getMySession().getL()).get("faield");
			getMySession().setMsg(msg, 2);
			ex.printStackTrace();
		}
	}
}
