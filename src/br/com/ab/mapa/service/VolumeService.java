package br.com.ab.mapa.service;

import java.util.ArrayList;
import java.util.List;

import br.com.ab.mapa.dao.VolumeDao;
import br.com.ab.mapa.entity.VolumeEntity;
import br.com.ab.mapa.model.Volume;

public class VolumeService {

	public List<Volume> getVolumes() {
		VolumeDao volumeDao = new VolumeDao();

		return binder(volumeDao.getVolumes());
	}

	private List<Volume> binder(List<VolumeEntity> volumes) {
		
		List<Volume> volumeModel = new ArrayList<Volume>();
		for (VolumeEntity volumeEntity : volumes) {
			volumeModel.add(new Volume(volumeEntity.getId(), volumeEntity.getNome(), volumeEntity.getValor()));
		}
		return volumeModel;
	}

}
