// for internal use only; GeoJSON encoding & decoding helpers
extension Point: CodableGeometry {
    static let geoJSONType = GeoJSONType.point

    var coordinates: [Double] {
        [x, y, z].compactMap({ $0 })
    }

    init(coordinates: [Double]) throws {
        guard coordinates.count >= 2 else {
            throw GEOSwiftError.invalidCoordinates
        }
        let z = coordinates.count >= 3 ? coordinates[2] : nil
        self.init(x: coordinates[0], y: coordinates[1], z: z)
    }
}
