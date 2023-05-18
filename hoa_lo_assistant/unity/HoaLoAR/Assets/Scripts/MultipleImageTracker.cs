using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.XR.ARFoundation;

public class MultipleImageTracker : MonoBehaviour
{
    [SerializeField]
    private GameObject[] placeablePrefabs;

    private Dictionary<string, GameObject> spawnedObjects = new Dictionary<string, GameObject>();  
    
    private ARTrackedImageManager trackedImageManager;
    
    private void Awake()
    {
        trackedImageManager = FindObjectOfType<ARTrackedImageManager>();

        foreach (GameObject obj in placeablePrefabs)
        {
            GameObject newObject = Instantiate(obj, Vector3.zero, Quaternion.identity);
            newObject.name = obj.name;
            newObject.SetActive(false);
            spawnedObjects.Add(newObject.name, newObject);
        }
    }

    private void OnEnable(){
        trackedImageManager.trackedImagesChanged += OnTrackedImageChanged;
    }

    private void OnDisable()
    {
        trackedImageManager.trackedImagesChanged -= OnTrackedImageChanged;
    }

    void OnTrackedImageChanged(ARTrackedImagesChangedEventArgs eventArgs){
        foreach (ARTrackedImage trackedImage in eventArgs.added)
        {
            UpdateSpawnObject(trackedImage);
        }

        foreach (ARTrackedImage trackedImage in eventArgs.updated)
        {
            UpdateSpawnObject(trackedImage);
        }

        foreach (ARTrackedImage trackedImage in eventArgs.removed)
        {
            Destroy(spawnedObjects[trackedImage.referenceImage.name]);
            // Also remove the instance from our array
            spawnedObjects.Remove(trackedImage.referenceImage.name);
        }
    }

    private void UpdateSpawnObject(ARTrackedImage trackedImage){
        string referenceImageName = trackedImage.referenceImage.name;
        Vector3 position = trackedImage.transform.position;

        GameObject prefab = spawnedObjects[referenceImageName];

        prefab.transform.position = position;
        prefab.transform.rotation = trackedImage.transform.rotation;
        prefab.SetActive(true);

        foreach (GameObject go in spawnedObjects.Values)
        {
            if(go.name != referenceImageName)
            {
                go.SetActive(false);
            }
        }
    }

}
