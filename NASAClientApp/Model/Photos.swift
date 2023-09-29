//
//  Photos.swift
//  NASAClientApp
//
//  Created by Evhen Lukhtan on 29.09.2023.

//   let photosResult = try? JSONDecoder().decode(PhotosResult.self, from: jsonData)

import Foundation

// MARK: - PhotosResult
struct PhotosResult: Codable {
    let photos: [Photo]
}

// MARK: - Photo
struct Photo: Codable {
    let id, sol: Int?
    let camera: PhotoCamera?
    let imgSrc: String?
    let earthDate: String?
    let rover: Rover?

    enum CodingKeys: String, CodingKey {
        case id, sol, camera
        case imgSrc = "img_src"
        case earthDate = "earth_date"
        case rover
    }
}

// MARK: - PhotoCamera
struct PhotoCamera: Codable {
    let id: Int?
    let name: String?
    let roverID: Int?
    let fullName: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case roverID = "rover_id"
        case fullName = "full_name"
    }
}

enum FullName: String, Codable {
    case chemistryAndCameraComplex = "Chemistry and Camera Complex"
    case frontHazardAvoidanceCamera = "Front Hazard Avoidance Camera"
    case marsDescentImager = "Mars Descent Imager"
    case marsHandLensImager = "Mars Hand Lens Imager"
    case mastCamera = "Mast Camera"
    case navigationCamera = "Navigation Camera"
    case rearHazardAvoidanceCamera = "Rear Hazard Avoidance Camera"
}

enum CameraName: String, Codable {
    case chemcam = "CHEMCAM"
    case fhaz = "FHAZ"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case mast = "MAST"
    case navcam = "NAVCAM"
    case rhaz = "RHAZ"
}

// MARK: - Rover
struct Rover: Codable {
    let id: Int?
    let name: String?
    let landingDate, launchDate: String?
    let status: String?
    let maxSol: Int?
    let maxDate: String?
    let totalPhotos: Int?
    let cameras: [CameraElement]

    enum CodingKeys: String, CodingKey {
        case id, name
        case landingDate = "landing_date"
        case launchDate = "launch_date"
        case status
        case maxSol = "max_sol"
        case maxDate = "max_date"
        case totalPhotos = "total_photos"
        case cameras
    }
}

// MARK: - CameraElement
struct CameraElement: Codable {
    let name: String?
    let fullName: String?

    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
    }
}

enum RoverName: String, Codable {
    case curiosity = "Curiosity"
    case opportunity = "Opportunity"
    case spirit = "Spirit"
}

enum Status: String, Codable {
    case active = "active"
}
