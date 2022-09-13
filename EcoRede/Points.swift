//
//  Points.swift
//  EcoRede
//
//  Created by João Franco on 13/09/2022.
//

import MapKit

class Artwork: NSObject, MKAnnotation {
  let eg: String?
  let concelho: String?
  let freguesia: String?
  let coordinate: CLLocationCoordinate2D

  init(
    eg: String?,
    concelho: String?,
    freguesia: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.eg = eg
    self.concelho = concelho
    self.freguesia = freguesia
    self.coordinate = coordinate

    super.init()
  }

  var subeg: String? {
    return concelho
  }
}
